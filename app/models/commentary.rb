# -*- encoding : utf-8 -*-
class Commentary < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  attr_accessible :body, :user_id, :video_id

  validates :user_id, :presence => true
  validates :video_id, :presence => true
end


# == Schema Information
#
# Table name: commentaries
#
#  id         :integer         not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  video_id   :integer
#

