class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    @user.save
  end

  def new
    @user = User.new
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
