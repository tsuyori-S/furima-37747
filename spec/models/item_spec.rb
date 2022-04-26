require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.jpg")
  end


  describe '商品出品' do
    context '商品を出品できる場合' do
      it 'image、name、information、category_id、state_id、delivery_fee_id、province_id、delivery_time_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'imageが入力されていれば登録できる' do
        expect(@item).to be_valid
      end
      it 'nameが入力されていれば登録できる' do
        @item.name = '商品の名前'
        expect(@item).to be_valid
      end
      it 'informationが入力されていれば登録できる' do
        @item.information = '商品の情報'
        expect(@item).to be_valid
      end
      it 'category_idが1以外だと登録できる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'state_idが1以外だと登録できる' do
        @item.state_id = '2'
        expect(@item).to be_valid
      end
      it 'delivery_fee_idが1以外だと登録できる' do
        @item.delivery_fee_id = '2'
        expect(@item).to be_valid
      end
      it 'province_idが1以外だと登録できる' do
        @item.province_id = '2'
        expect(@item).to be_valid
      end
      it 'delivery_time_idが1以外だと登録できる' do
        @item.delivery_time_id = '2'
        expect(@item).to be_valid
      end
      it 'priceが半角数字で300以上、9,999,999以下だと登録できる' do
        @item.price = '10000'
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'informationが空だと登録できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'state_idが1だと登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'delivery_fee_idが1だと登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'province_idが1だと登録できない' do
        @item.province_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Province can't be blank")
      end
      it 'delivery_time_idが1だと登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外だと登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300以下だと登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
