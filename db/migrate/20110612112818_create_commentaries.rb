# -*- encoding : utf-8 -*-
class CreateCommentaries < ActiveRecord::Migration
  def self.up
    create_table :commentaries do |t|
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :commentaries
  end
end
