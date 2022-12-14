class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(6).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  def tops
    @items = Item.where(genre_id: 2).page(params[:page]).per(6).order("created_at DESC")
  end
  
  def bottoms
    @items = Item.where(genre_id: 3).page(params[:page]).per(6).order("created_at DESC")
  end

  def dresses
    @items = Item.where(genre_id: 4).page(params[:page]).per(6).order("created_at DESC")
  end

  def outer
    @items = Item.where(genre_id: 5).page(params[:page]).per(6).order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :material, :centimeter, :price, :reservation_id, :size_id, :genre_id, images:[])
  end
end