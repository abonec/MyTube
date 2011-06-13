# -*- encoding : utf-8 -*-
class Video < ActiveRecord::Base
  include AASM
  ACCEPTED_FORMATS = 
      [ 'application/x-mp4',
        'video/mpeg',
        'video/quicktime',
        'video/x-la-asf',
        'video/x-ms-asf',
        'video/x-msvideo',
        'video/x-sgi-movie',
        'video/x-flv',
        'flv-application/octet-stream',
        'video/3gpp',
        'video/3gpp2',
        'video/3gpp-tt',
        'video/BMPEG',
        'video/BT656',
        'video/CelB',
        'video/DV',
        'video/H261',
        'video/H263',
        'video/H263-1998',
        'video/H263-2000',
        'video/H264',
        'video/x-matroska',
        'video/JPEG',
        'video/MJ2',
        'video/MP1S',
        'video/MP2P',
        'video/MP2T',
        'video/mp4',
        'video/MP4V-ES',
        'video/MPV',
        'video/mpeg4',
        'video/mpeg4-generic',
        'video/nv',
        'video/parityfec',
        'video/pointer',
        'video/raw',
        'video/rtx' ]
  has_many :converted_videos
  has_many :commentaries
  belongs_to :user

  has_attached_file :source
  validates_attachment_presence :source
  validates_attachment_content_type :source, :content_type => ACCEPTED_FORMATS, :message => 'invalid please try other video file'

  before_destroy :delete_files

  
  aasm_column :state
  aasm_initial_state :pending
  aasm_state :converting
  aasm_state :pending
  aasm_state :converted
  aasm_state :error
  aasm_event :to_convert do
    transitions :to => :converting, :from => [:pending]
  end
  aasm_event :converted do
    transitions :to => :converted, :from => [:converting]
  end
  aasm_event :got_error do
    transitions :to => :error, :from => [:converting]
  end
  aasm_event :reconvert do
    transitions :to => :pending, :from => [:converted, :error]
  end


  def transcode!
    transcoded_filename = File.join(File.dirname(source.path),Russian.translit(File.basename(source.path, ".*")))+ ".flv"
    video = FFMPEG::Movie.new(source.path)
    options = {:audio_sample_rate => 44100}
    to_convert!
    begin
      video.transcode(transcoded_filename, options)
    rescue
      got_error!
      return false
    end
    converted = ConvertedVideo.new
    converted.fill_from_path transcoded_filename
    self.converted_videos << converted
    save
    converted!
    return true
  end
  def get_thumbnail!
    thumbnail_filename = full_path(source.path, "jpg")
    if self.thumbnail_file_name
      delete_by_relative_path File.join(self.thumbnail_dir, self.thumbnail_file_name)
    end
    video = FFMPEG::Movie.new(source.path)
    begin
      video.transcode(thumbnail_filename, "-ss #{video.duration/2} -f image2 -vframes 1")
    rescue
      return false
    end
    self.thumbnail_file_name = File.basename(thumbnail_filename)
    self.thumbnail_dir = thumbnail_filename.sub(File.join(RAILS_ROOT, 'public'), '').sub(self.thumbnail_file_name, '')
    save
  end

  def thumbnail_url
    File.join(thumbnail_dir, thumbnail_file_name)
  end

  private
  def delete_files
    begin
      self.converted_videos.each { |video| video.destroy }
      delete_by_relative_path(thumbnail_url)
    rescue
      Rails.logger.error "Cannot delete converted video file from file id #{self.id}"
    end
  end

  def full_path(path, extension)
    File.join(File.dirname(path),Russian.translit(File.basename(path, ".*").force_encoding('utf-8')))+ ".#{extension}"
  end
  
  def delete_by_relative_path(path)
    File.delete(File.join(RAILS_ROOT, 'public', path))
  end

end




# == Schema Information
#
# Table name: videos
#
#  id                  :integer         not null, primary key
#  source_file_name    :string(255)
#  source_content_type :string(255)
#  source_file_size    :integer
#  state               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  converted           :string(255)
#  user_id             :integer
#  title               :string(255)
#  description         :text
#  thumbnail_file_name :string(255)
#  thumbnail_dir       :string(255)
#

