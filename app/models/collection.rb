class Collection < ApplicationRecord
  has_many_attached :images
  validates :images, presence: true
  validates :season_id, numericality: { other_than: 1 , message: "can't be blank"}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :season
end
