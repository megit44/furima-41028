require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報をデータベースに保存' do
    context '商品情報が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it '画像が空の場合、保存できない' do
        @item.image.purge
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空の場合、保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空の場合、保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '価格が空の場合、保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が半角数字以外の場合、保存できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が全角の場合、保存できない' do
        @item.price = '３３あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が数字と文字が混ざっている場合、保存できない' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格がスペースを含む場合、保存できない' do
        @item.price = ' 300 '
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it '価格が小数の場合、保存できない' do
        @item.price = 300.50
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it '価格が299以下の場合、保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が10,000,000以上の場合、保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'カテゴリーが0の場合、保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が0の場合、保存できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が0の場合、保存できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it '発送元の地域が0の場合、保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が0の場合、保存できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
    end
  end
end
