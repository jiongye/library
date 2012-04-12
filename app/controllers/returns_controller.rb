class ReturnsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @lending = Lending.find(params[:id])
  end

  def update
    @lending = Lending.find(params[:id])
    @lending.returned = true

    if @lending.update_attributes(params[:lending])
      redirect_to lendings_path, :notice => 'The book was successfully returned'
    else
      render :action => "edit"
    end
  end

end
