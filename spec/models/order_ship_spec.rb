require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      item.save
      @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_ship).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_ship.building_name = ''
        expect(@order_ship).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_ship.post_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_id が未選択だと保存できないこと' do
        @order_ship.prefecture_id = 1
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_ship.address = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @order_ship.token = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと出品できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと出品できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例:123-4567 良くない例:1234567）' do
        @order_ship.post_code = '1234567'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Post code is invalid')
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @order_ship.phone_number = '123456789234'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @order_ship.token = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
