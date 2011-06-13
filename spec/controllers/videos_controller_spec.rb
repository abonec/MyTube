# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe VideosController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Video.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Video.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Video.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(video_url(assigns[:video]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Video.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Video.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Video.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Video.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Video.first
    response.should redirect_to(video_url(assigns[:video]))
  end

  it "destroy action should destroy model and redirect to index action" do
    video = Video.first
    delete :destroy, :id => video
    response.should redirect_to(videos_url)
    Video.exists?(video.id).should be_false
  end
end
