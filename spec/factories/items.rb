FactoryBot.define do
  
  factory :item do
    name            { 'てすと' }
    content         { Faker::Lorem.sentence }
    material        { Faker::Lorem.sentence }
    centimeter      { '肩幅:50cm/身幅:50cm/着丈:50cm' }
    price           { Faker::Number.between(from: 300, to: 9999999) }
    reservation_id  { '2' }
    size_id         { '2' }
    
    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      item.images.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end

  end
end