# -*- encoding : utf-8 -*-
class AddConvertedToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :converted, :string
  end

  def self.down
    remove_column :videos, :converted
  end
end
