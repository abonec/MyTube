# -*- encoding : utf-8 -*-
class CreateConvertedVideos < ActiveRecord::Migration
  def self.up
    create_table :converted_videos do |t|
      t.string :filename
      t.string :dir
      t.integer :video_id

      t.timestamps
    end
  end

  def self.down
    drop_table :converted_videos
  end
end
