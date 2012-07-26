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
    @story.body
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path, :flash => {:notice => "Story '#{@story.title}' was deleted." }
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
    if @story.update_attributes(params[:story])
      redirect_to :action => 'show', :id => @story
    else
#      @user = User.find(:all)
      render :action => 'edit'
    end
  end

end
