class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
     @comment = current_user.comments.build(params[:comment])
     @comment.story_id = params[:story_id]
     @comment.save

     redirect_to story_path
  end

  def show
    @comment = Comment.find(params[:id])
    @comment.body
  end

  def index
    @comments = Comment.all
#    @comments = Comment.order('created_at DESC').page(params[:page]).per(10)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path, :flash => {:notice => "Comment '#{@comment.title}' was successfully deleted." }
  end

  def update
    @comment = Comment.find(params[:id])
    if Time.now - @comment.created_at > 1000 * 60 * 15
      if @comment.update_attributes(params[:comment])
        redirect_to :action => 'show', :id => @comment
      else
        render :action => 'edit'
      end
    else
      redirect_to :action => 'show', :id => @comment, :notice => 'I\'m sorry, you cannot edit comments after 15 minutes.'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = current_user.votes.build(:comment => @comment, :value => params[:vote][:value])
  end

end
