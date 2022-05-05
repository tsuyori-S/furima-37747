require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入先情報の保存' do
    context '情報が保存される場合' do
      it '全てが入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'user_idが紐づいていれば保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end
      it 'item_idが紐づいていれば保存できる' do
        @order_address.item_id = 1
        expect(@order_address).to be_valid
      end
      it 'postal_codeが「3桁ー4桁」であれば保存できる' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'province_idが1以外だと保存できる' do
        @order_address.province_id = 2
        expect(@order_address).to be_valid
      end
      it 'cityが空でなければ保存できる' do
        @order_address.city = '立川市'
        expect(@order_address).to be_valid
      end
      it 'house_numberが空でなければ保存できる' do
        @order_address.house_number = '立川町123'
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
      it 'phone_numberが10桁か11桁で、ハイフンがなければ保存できる' do
        @order_address.phone_number = 1234567890
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば保存できる' do
        @order_address.token = 'tok_abcdefghijk00000000000000000'
        expect(@order_address).to be_valid
      end
    end

    context '情報が保存されない場合' do
      it 'user_idが紐づいていなければ保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが紐づいていなければ保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフンが含まれてないと保存できない' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号が不適です。ハイフン（ー）を入れてください")
      end
      it 'province_idが1だと保存できない' do
        @order_address.province_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと保存できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberにハイフンが含まれていると保存できない' do
        @order_address.phone_number = '123-4567-890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it 'tokenが空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end