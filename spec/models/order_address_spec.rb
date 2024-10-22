require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, postal_code: '123-4567', phone_number: '09012345678')
  end

  describe 'バリデーション' do
    context '有効な場合' do
      it '全ての属性が正しいときは有効である' do
        expect(@order_address).to be_valid
      end
    end

    context '無効な場合' do
      it 'user_idが空であると無効である' do
        @order_address.user_id = nil
        expect(@order_address).not_to be_valid
      end

      it 'item_idが空であると無効である' do
        @order_address.item_id = nil
        expect(@order_address).not_to be_valid
      end

      it '郵便番号が無効であると無効である' do
        @order_address.postal_code = '1234567' # ハイフンなし
        expect(@order_address).not_to be_valid
      end

      it '郵便番号が不正な形式であると無効である' do
        @order_address.postal_code = '123-456' # 不正な形式
        expect(@order_address).not_to be_valid
      end

      it '郵便番号が空であると無効である' do
        @order_address.postal_code = nil
        expect(@order_address).not_to be_valid
      end

      it '都道府県IDが0であると無効である' do
        @order_address.prefecture_id = 0
        expect(@order_address).not_to be_valid
      end

      it '市区町村が空であると無効である' do
        @order_address.city = ''
        expect(@order_address).not_to be_valid
      end

      it '番地が空であると無効である' do
        @order_address.house_number = ''
        expect(@order_address).not_to be_valid
      end

      it '電話番号が無効であると無効である' do
        @order_address.phone_number = '123456789' # 不正な形式
        expect(@order_address).not_to be_valid
      end

      it '電話番号がハイフンを含むと無効である' do
        @order_address.phone_number = '090-1234-5678' # 不正な形式
        expect(@order_address).not_to be_valid
      end

      it '電話番号が空であると無効である' do
        @order_address.phone_number = nil
        expect(@order_address).not_to be_valid
      end

      it '電話番号が11桁を超えると無効である' do
        @order_address.phone_number = '090123456789' # 不正な形式
        expect(@order_address).not_to be_valid
      end

      it '電話番号が9桁未満だと無効である' do
        @order_address.phone_number = '123456789' # 不正な形式
        expect(@order_address).not_to be_valid
      end
    end
  end
end
