class Season < ActiveHash::Base
  self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '2022aw' },
   { id: 3, name: '2023ss' },
   { id: 4, name: '2023aw' },
   { id: 5, name: '2024ss' },
   { id: 6, name: '2024aw' },
   { id: 7, name: '2025ss' },
   { id: 8, name: '2025aw' },
   { id: 9, name: '2026ss' },
   { id: 10, name: '2026aw' },
   { id: 11, name: '2027ss' },
   { id: 12, name: '2027aw' },
   { id: 13, name: '2028ss' },
   { id: 14, name: '2028aw' },
   { id: 15, name: '2029ss' },
   { id: 16, name: '2029aw' },
 ]

  include ActiveHash::Associations
  has_many :collections
end