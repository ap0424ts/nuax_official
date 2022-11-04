class Public::ItemsController < ApplicationController
  def index
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :material, :centimeter, :price, :reservation_id, :size_id, :images).merge(user_id: admin_user.id)
  end
end
