class LendingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @q = Lending.ransack(params[:q])
    @lendings = Lending.active.includes(:book).includes(:member).includes(:course_period).order(:due_date).page(params[:page])
  end

  def new
    @lending = Lending.new
  end

  def create
    @lending = Lending.new(params[:lending])

    if @lending.save
      redirect_to lendings_path, :notice => 'The new lending was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @lending = Lending.find(params[:id])
  end

  def update
    @lending = Lending.find(params[:id])

    if @lending.update_attributes(params[:lending])
      redirect_to lendings_path, :notice => 'The lending was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @lending = Lending.find(params[:id])

    @lending.destroy
    redirect_to lendings_path, :notice => "The lending was successfully deleted"
  end

end
