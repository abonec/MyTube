# -*- encoding : utf-8 -*-
class RemoveThumbnailFromVideos < ActiveRecord::Migration
  def self.up
    remove_column :videos, :thumbnail
  end

  def self.down
    add_column :videos, :thumbnail, :binary
  end
end
