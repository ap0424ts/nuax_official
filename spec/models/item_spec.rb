require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '出品できる場合' do
      it "すべての項目に入力があれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが41文字以上では登録できない' do
        @item.name = '012345678901234567890123456789012345678901'
        @item.valid?
        expect(@item.errors.full_messages).to include "Name is too long (maximum is 40 characters)"
      end
      it 'contentが1001文字以上では登録できない' do
        @item.content = '0' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Content is too long (maximum is 1000 characters)"
      end
      it 'materialが空では登録できない' do
        @item.material = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Material can't be blank"
      end
      it 'centimeterが空では登録できない' do
        @item.centimeter = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Centimeter can't be blank"
      end
      it 'centimeterが1001文字以上では登録できない' do
        @item.centimeter = '0' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Centimeter is too long (maximum is 1000 characters)"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角整数以外では登録できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'reservation_idが空では登録できない' do
        @item.reservation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Reservation can't be blank"
      end
      it 'reservation_idが2~4以外では登録できない' do
        @item.reservation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Reservation can't be blank"
      end
      it 'size_idが空では登録できない' do
        @item.size_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Size can't be blank"
      end
      it 'size_idが2~6以外では登録できない' do
        @item.size_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Size can't be blank"
      end
      it 'imagesが空では登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Images can't be blank"
      end
    end

  end
end
