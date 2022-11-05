class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :material, :centimeter, :price, :reservation_id, :size_id, images:[])
  end
end