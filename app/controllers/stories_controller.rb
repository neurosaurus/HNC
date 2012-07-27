class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def index
    @stories = Story.scoped.order('created_at DESC').page(params[:page]).per(20)
  end

  def create
    @story = current_user.stories.new(params[:story])
    @story.save

    redirect_to stories_path
  end

  def show
    @story = Story.find(params[:id])
    @comments = Comment.where("story_id = ?", params[:id])
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path, :flash => {:notice => "Story '#{@story.title}' was successfully deleted." }
  end

  def edit
    @story = Story.find(params[:id])
  end

  def vote
    @story = Story.find(params[:id])
    @vote = current_user.votes.build(:story => @story, :value => params[:vote][:value])

    # current_user.votes.include?(@vote) == true   #build
    # current_user.votes.include?(@vote) == false  #new

    # if @vote.save
    #   ...
    # else
    #   ...
    # end
  end

  def update
    @story = Story.find(params[:id])
    if Time.now - @story.created_at > 1000 * 60 * 15
      if @story.update_attributes(params[:story])
        redirect_to :action => 'show', :id => @story
      else
        render :action => 'edit'
      end
    else
      redirect_to story_path, :flash => {:notice => 'I\'m sorry, you cannot edit stories after 15 minutes.'}
    end
  end

end
