class Public::OrdersController < ApplicationController

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      # p "order_shipping保存可能？"
      @order_shipping.save
      items = current_cart.items
      items.each do |item|
        cart_item = CartItem.where(item_id: item.id, cart_id: current_cart.id).first
        order_detail = OrderDetail.new
        order_detail.item_id = item.id
        @order = Order.find_by(cart_id: current_cart.id)
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.quantity
        order_detail.save!
        #もしログインしているユーザーの場合は、Orderにuser_idを結びつける
        #Orderのorder_detail_idに上で作ったデータを入れる
        #最後にcartと、紐づいているcart_itemを削除
      end
      redirect_to root_path
    else
      render :index
    end



  end
  

  private


  def order_params
    params.require(:order_shipping).permit(:post_code, :state, :city, :addres, :building ,:phone_number).merge(cart_id: current_cart.id, token: params[:token])
  end

end
