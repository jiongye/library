class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.includes(:role).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :notice => 'The new user was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'The user was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path, :notice => "The user was successfully deleted"
  end

end
