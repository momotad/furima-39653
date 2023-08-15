require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
    before do
      @buy_delivery = FactoryBot.build(:buy_delivery)
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_delivery).to be_valid
      end
      it '建物名が空でも購入できること' do
        @buy_delivery.building = ''
        expect(@buy_delivery).to be_valid
      end
    end

    context '購入できない場合' do
      it 'クレジットカード未入力' do
        @buy_delivery.token = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空' do
        @buy_delivery.postcode = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号に「-」が使用されていない' do
        @buy_delivery.postcode = '1234567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が全角' do
        @buy_delivery.postcode = '１２３−４５６７'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が選択されていない' do
        @buy_delivery.area_id = '1'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空' do
        @buy_delivery.city = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空' do
        @buy_delivery.telephone = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号が9桁以内' do
        @buy_delivery.telephone = '090111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone Input only number")
      end
      it '電話番号が12桁以上' do
        @buy_delivery.telephone = '090111111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone Input only number")
      end
      it '電話番号が全角' do
        @buy_delivery.telephone = '０９０１１１１１１１１'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone Input only number")
      end
      it '電話番号に「-」を使用' do
        @buy_delivery.telephone = '090-1111-1111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone Input only number")
      end
    end

end