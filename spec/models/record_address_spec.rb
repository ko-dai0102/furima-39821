require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:user)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'postal_code, prefecture_id, city, address, building, phone_number, user_id, item_id, tokenが存在すれば購入できる' do
        expect(@record_address).to be_valid
      end
      it 'buildingが無くても購入できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'postal_codeが空だと購入できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空だと購入できない' do
        @record_address.prefecture_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @record_address.user_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @record_address.item_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeに-がないと購入できない' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが1だと購入できない' do
        @record_address.prefecture_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'phone_numberに全角数字が入っていると購入できない' do
        @record_address.phone_number = '０123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに文字が入っていると購入できない' do
        @record_address.phone_number = 'あ123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @record_address.phone_number = '123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @record_address.phone_number = '123456789012'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end