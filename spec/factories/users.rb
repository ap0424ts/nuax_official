FactoryBot.define do
  factory :user do
    last_name             { '太郎' }
    first_name            { '田中' }
    last_name_kana        { 'タロウ' }
    first_name_kana       { 'タナカ' }
    email                 { Faker::Internet.free_email}
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password}
  end
end