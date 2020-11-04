require 'rails_helper'
describe OrderPurchaser do
  before do
    @order_purchaser = FactoryBot.build(:order_purchaser)
  end


  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'item_idとuser_idとpostal_codeとprefecturesとmunicipalityとaddressとphone_numberとtokenが存在すれば登録できる' do
        expect(@order_purchaser).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'item_idが空だと登録できない' do
        @order_purchaser.item_id = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Itemを入力してください')
      end

      it 'user_id空だと登録できない' do
        @order_purchaser.user_id = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Userを入力してください')
      end

      it 'postal_codeが空だと登録できない' do
        @order_purchaser.postal_code = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Postal codeを入力してください')
      end
      
      it 'postal_codeが8桁以上(ハイフン除く)だと登録できない' do
        @order_purchaser.postal_code = '111-11111'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Postal codeは不正な値です')
      end
      
      it 'postal_codeが8桁以上(ハイフンなし)だと登録できない' do
        @order_purchaser.postal_code = '11111111'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Postal codeは不正な値です')
      end

      
      it 'prefecturesが空だと登録できない' do
        @order_purchaser.prefectures = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Prefecturesを入力してください')
      end
      
      it 'prefecturesが1では登録できない' do
        @order_purchaser.prefectures = 1
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Prefecturesは1以外の値にしてください')
      end
      
      it 'municipalityが空だと登録できない' do
        @order_purchaser.municipality = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Municipalityを入力してください')
      end
      
      it 'addressが空だと登録できない' do
        @order_purchaser.address = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Addressを入力してください')
      end
      
      it 'phone_numberが空だと登録できない' do
        @order_purchaser.phone_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone numberを入力してください')
      end
      
      it 'phone_numberが12桁以上(- 抜き)では登録できない' do
        @order_purchaser.phone_number = '080123456789'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone numberは不正な値です')
      end

      it 'tokenが空だと登録できない' do
        @order_purchaser.token = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Tokenを入力してください')
      end


    end
  end
end
