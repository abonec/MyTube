# -*- encoding : utf-8 -*-
class CommentariesController < ApplicationController
  before_filter :authenticate_user!
  def index
    #@commentaries = Commentary.all
  end

  def show
    #@commentary = Commentary.find(params[:id])
  end

  def new
    #@commentary = Commentary.new
  end

  def create
    @video = Video.find(params[:video_id])
    @commentary = @video.commentaries.build(params[:commentary])
    @commentary.user = current_user
    if @commentary.save
      redirect_to @video, :notice => "Successfully created commentary."
    else
      render :action => 'new'
    end
  end

  def edit
    #@commentary = Commentary.find(params[:id])
  end

  def update
    #@commentary = Commentary.find(params[:id])
    #if @commentary.update_attributes(params[:commentary])
      #redirect_to @commentary, :notice  => "Successfully updated commentary."
    #else
      #render :action => 'edit'
    #end
  end

  def destroy
    #@commentary = Commentary.find(params[:id])
    #@commentary.destroy
    #redirect_to commentaries_url, :notice => "Successfully destroyed commentary."
  end
end
