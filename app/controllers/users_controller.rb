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
    @user.build_contact
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :notice => 'The new user was successfully created'
    else
      @user.build_contact unless @user.contact
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.build_contact unless @user.contact
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'The user was successfully updated'
    else
      @user.build_contact unless @user.contact
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path, :notice => "The user was successfully deleted"
  end

end
