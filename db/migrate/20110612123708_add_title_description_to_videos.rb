# -*- encoding : utf-8 -*-
class AddTitleDescriptionToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :title, :string
    add_column :videos, :description, :text
  end

  def self.down
    remove_column :videos, :description
    remove_column :videos, :title
  end
end
