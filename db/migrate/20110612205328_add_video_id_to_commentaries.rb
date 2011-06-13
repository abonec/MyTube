class AddVideoIdToCommentaries < ActiveRecord::Migration
  def self.up
    add_column :commentaries, :video_id, :integer
  end

  def self.down
    remove_column :commentaries, :video_id
  end
end
