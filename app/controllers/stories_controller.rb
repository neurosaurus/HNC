class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def index
    @stories = Story.all
  end

  def create
    @story = Story.new(params[:story])
    @story.save

    redirect_to stories_path
  end

  def show
    @story = Story.find(params[:id])
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
  end

  def edit
    @story = Story.find(params[:id])
  end

end
