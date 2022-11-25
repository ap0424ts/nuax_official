class Collection < ApplicationRecord
  has_many_attached :images
  validates :images, presence: true
  validates :season, presence: true
end
