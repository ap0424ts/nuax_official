class Order < ApplicationRecord
  has_one    :shipping
  has_many   :order_details, dependent: :destroy
  has_many   :items, through: :order_details
end
