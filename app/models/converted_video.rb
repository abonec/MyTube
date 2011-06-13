# -*- encoding : utf-8 -*-
class ConvertedVideo < ActiveRecord::Base
  belongs_to :video
  before_destroy :delete_file

  def fill_from_path(path)
    self.filename = File.basename(path)
    relative_path = path.sub(File.join(RAILS_ROOT, "public"), '')
    self.dir = relative_path.sub(filename, '')
  end    
  
  def url
    File.join(dir, filename)
  end

  def path
    File.join(RAILS_ROOT, "public", dir, filename)
  end

  private
  def delete_file
    File.delete(path) if File.exists? path
  end
end

# == Schema Information
#
# Table name: converted_videos
#
#  id         :integer         not null, primary key
#  filename   :string(255)
#  dir        :string(255)
#  video_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

