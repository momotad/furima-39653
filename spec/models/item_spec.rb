require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の商品情報' do
    context '商品出品ができる場合' do
      it '必要な情報をすべて入力' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it '商品画像なし' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名なし' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明なし' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'カテゴリー情報なし' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態情報なし' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担情報なし' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it '発送元の地域情報なし' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数情報なし' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it '価格が全角数字' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range & Input half-width characters')
      end
      it '価格が空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range & Input half-width characters')
      end
      it '価格が299円以下' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range & Input half-width characters')
      end
      it '価格が10000000円以上' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range & Input half-width characters')
      end
      it 'ユーザーが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
