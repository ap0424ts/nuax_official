class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'TOPS' },
    { id: 3, name: 'BOTTOMS' },
    { id: 4, name: 'DRESSES' },
    { id: 5, name: 'OUTERWEAR' }
  ]

  include ActiveHash::Associations
  has_many :items
  end