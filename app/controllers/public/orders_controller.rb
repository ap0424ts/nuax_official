class Public::OrdersController < ApplicationController

  def all_order
    
  end

  def index
    @cart_items = current_cart.cart_items.includes([:item])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    if @total == 0
      redirect_to root_path
    else
      @order_shipping = OrderShipping.new
    end
  end

  def create
    if current_user
      @order_shipping = OrderShipping.new(order_user_params)
    else
      @order_shipping = OrderShipping.new(order_params)
    end

    if @order_shipping.valid?
      @cart_items = current_cart.cart_items.includes([:item])
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
      pay_item
      @order_shipping.save
      items = current_cart.items
      items.each do |item|
        @order = Order.where(cart_id: current_cart.id).last
        cart_item = CartItem.where(item_id: item.id, cart_id: current_cart.id).first
        order_detail = OrderDetail.new
        order_detail.item_id = item.id
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.quantity
        order_detail.save!
      end

      if current_user #ログインしている場合は、Orderにuser_idを結びつける
        @order = Order.where(cart_id: current_cart.id).last
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

  def order_user_params
    params.require(:order_shipping).permit(:last_name, :first_name, :post_code, :state, :city, :addres, :building ,:phone_number).merge(user_id:current_user.id, cart_id: current_cart.id, token: params[:token])
  end
  def order_params
    params.require(:order_shipping).permit(:last_name, :first_name, :post_code, :state, :city, :addres, :building ,:phone_number).merge(cart_id: current_cart.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @total,  # 商品の値段
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
