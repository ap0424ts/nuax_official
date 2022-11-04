class Reservation < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '即納品可' },
   { id: 3, name: '受注生産' },
   { id: 4, name: '予約' },
 ]

  include ActiveHash::Associations
  has_many :items
end