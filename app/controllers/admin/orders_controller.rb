class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]
  
  def index
    @orders = Order.all.order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes([:item])
    @total = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
    @shipping = Shipping.find(params[:id])
  end


end
