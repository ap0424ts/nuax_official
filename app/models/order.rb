class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cart, optional: true, dependent: :destroy
  has_one    :shipping
  has_many   :order_details, dependent: :destroy
end
