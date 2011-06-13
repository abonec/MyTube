# -*- encoding : utf-8 -*-
class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.binary :thumbnail
      t.string :source_file_name
      t.string :source_content_type
      t.integer :source_file_size
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
