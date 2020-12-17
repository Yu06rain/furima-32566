require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    @transaction = FactoryBot.build(:transaction)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@transaction).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @transaction.building_name = nil
        expect(@transaction).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'postal_codeが空だと購入できない' do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @transaction.postal_code = '1234567'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'regionが未選択だと購入できない' do
        @transaction.region_id = 0
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Region Select')
      end
      it 'municipalityが空だと購入できない' do
        @transaction.municipality = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @transaction.address = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @transaction.phone_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @transaction.phone_number = '090123456789'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが数字のみでないと登録できない' do
        @transaction.phone_number = '090aaaaああああ'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空では登録できないこと' do
        @transaction.token = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @transaction.user_id = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @transaction.item_id = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
