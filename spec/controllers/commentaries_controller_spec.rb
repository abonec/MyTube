# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe CommentariesController do
  fixtures :all
  render_views

  it "create action should render new template when model is invalid" do
    Commentary.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Commentary.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(commentary_url(assigns[:commentary]))
  end

end
