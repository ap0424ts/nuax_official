class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :order_detail_id, :user_id, :cart_id, :last_name, :first_name, :post_code, :state, :city, :addres, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :last_name,   format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :first_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :post_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを入れて入力してください"}
    validates :state
    validates :city
    validates :addres
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
  end

  def save
    @order = Order.create!(user_id: user_id, cart_id: cart_id)
    Shipping.create!(last_name: last_name, first_name: first_name, post_code: post_code, state: state, city: city, addres: addres, building: building, phone_number: phone_number, order_id:@order.id)
  end

end