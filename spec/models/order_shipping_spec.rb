require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        building = ''
        expect(@order_shipping).to be_valid
      end
      it 'user_idは空でも保存できること' do
        user_id = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_codeが空だと保存できないこと' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeが「3桁 - 4桁]の半角文字列でないと保存できないこと' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'stateが空だと保存できないこと' do
        @order_shipping.state = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "State can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "City can't be blank"
      end
      it 'addresが空だと保存できないこと' do
        @order_shipping.addres = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Addres can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは半角数字以外だと保存できないこと' do
        @order_shipping.phone_number = 'abcdefghij'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは9桁以下だと保存できないこと' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは12桁以上だと保存できないこと' do
        @order_shipping.phone_number = '123456789123'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end