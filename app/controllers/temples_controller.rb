class TemplesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @temples = Temple.all
  end

  def new
    @temple = Temple.new
  end

  def create
    @temple = Temple.new(params[:temple])

    if @temple.save
      redirect_to temples_path, :notice => 'The new temple was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @temple = Temple.find(params[:id])
  end

  def update
    @temple = Temple.find(params[:id])

    if @temple.update_attributes(params[:temple])
      redirect_to temples_path, :notice => 'The temple was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @temple = Temple.find(params[:id])

    @temple.destroy
    redirect_to temples_path, :notice => "The temple was successfully deleted"
  end

end
