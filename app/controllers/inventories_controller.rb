class InventoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @inventories = Inventory.page(params[:page])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(params[:inventory])

    if @inventory.save
      redirect_to inventories_path, :notice => 'The new inventory was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])

    if @inventory.update_attributes(params[:inventory])
      redirect_to inventories_path, :notice => 'The inventory was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    @inventory.destroy
    redirect_to inventories_path, :notice => "The inventory was successfully deleted"
  end

end
