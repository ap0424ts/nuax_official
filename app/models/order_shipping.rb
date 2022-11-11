class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :order_detail_id, :user_id, :post_code, :area_id, :city, :addres, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :order_detail_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :state
    validates :city
    validates :addres
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
  end

  def save
    order = Order.create(order_detail_id: order_detail_id, user_id: user_id)
    Shipping.create(post_code: post_code, state: state, city:city, addres:addres, building:building, phone_number:phone_number, order_id:order.id)
  end
end