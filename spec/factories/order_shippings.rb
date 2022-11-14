FactoryBot.define do
  factory :order_shipping do
    token        {"tok_abcdefghijk00000000000000000"}
    last_name    { '田中' }
    first_name   { '太郎' }
    post_code    { '123-4567' }
    state        { '東京都' }
    city         { '世田谷区' }
    addres       { 'テスト町1-1-1' }
    building     { 'テストビル101' }
    phone_number { '09012345678'}
  end
end