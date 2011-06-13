# -*- encoding : utf-8 -*-
class VideosController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    @video.user = current_user
    if @video.save
      @video.get_thumbnail!
      redirect_to @video, :notice => "Successfully created video."
    else
      render :action => 'new'
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      @video.get_thumbnail!
      redirect_to @video, :notice  => "Successfully updated video."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_url, :notice => "Successfully destroyed video."
  end
end
