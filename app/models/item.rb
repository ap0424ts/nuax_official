class Item < ApplicationRecord
  has_many_attached :images
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :material, presence:true
  validates :centimeter, presence:true, length: { maximum: 1000 }
  validates :price, presence:true, numericality: {only_integer: true }
  validates :reservation_id, :size_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :reservation, :size
end
