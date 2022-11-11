class Shipping < ApplicationRecord
  has_one :order
end
