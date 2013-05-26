class LendingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@q = Lending.ransack(params[:q])
    @lendings = Lending.active.includes(:book).includes(:member).order(:due_date).page(params[:page])
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

  def destroy
    @lending = Lending.find(params[:id])

    @lending.destroy
    redirect_to lendings_path, :notice => "The lending was successfully deleted"
  end

end
