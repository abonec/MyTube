class SplitThumbnailToNameAndPath < ActiveRecord::Migration
  def self.up
    remove_column :videos, :thumbnail
    add_column :videos, :thumbnail_file_name, :string
    add_column :videos, :thumbnail_dir, :string
  end

  def self.down
    remove_column :videos, :thumbnail_dir
    remove_column :videos, :thumbnail_file_name
    add_column :videos, :thumbnail, :string

  end
end
