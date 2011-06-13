# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Commentary do
  it "should be valid" do
    Commentary.new.should be_valid
  end
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

