class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  def tops
    @items = Item.all.order("created_at DESC")
  end
  private

  def item_params
    params.require(:item).permit(:name, :content, :material, :centimeter, :price, :reservation_id, :size_id, :genre_id, images:[])
  end
end