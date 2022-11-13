class Public::OrdersController < ApplicationController

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      items = current_cart.items
      items.each do |item|
        @order = Order.find_by(cart_id: current_cart.id)
        cart_item = CartItem.where(item_id: item.id, cart_id: current_cart.id).first
        order_detail = OrderDetail.new
        order_detail.item_id = item.id
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.quantity
        order_detail.save!
      end
      if current_user #ログインしているユーザーは
        @order = Order.find_by(cart_id: current_cart.id)
        @order.user_id = current_user.id
        redirect_to root_path
        items.destroy_all
      else
        redirect_to root_path
        items.destroy_all
      end
    else
      render :index
    end



  end
  

  private


  def order_params
    params.require(:order_shipping).permit(:post_code, :state, :city, :addres, :building ,:phone_number).merge(cart_id: current_cart.id, token: params[:token])
  end

end
