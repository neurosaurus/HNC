class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def index
    @stories = Story.scoped.page(params[:page]).per(20)
  end

  def create
    @story = current_user.stories.new(params[:story])
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

  def vote
    @story = Story.find(params[:id])
    @vote = current_user.votes.build(:story => @story, :value => params[:vote][:value])

    # current_user.votes.include?(@vote) == true   #build
    # current_user.votes.include?(@vote) == false  #new

    if @vote.save
      ...
    else
      ...
    end
  end
end
