require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "nameとcategory_idとdescriptionとstatus_idとdelivery_charge_idとshipment_source_idとshipping_day_idとpriceとuser_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end

      it "descriptionが空だと登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Descriptionを入力してください")
      end

      it "categoryが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end

      it "status_idが空だと登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Statusを入力してください")
      end

      it "status_idが1では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Statusは1以外の値にしてください")
      end

      it "delivery_charge_idが空だと登録できない" do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery chargeを入力してください")
      end

      it "delivery_charge_idが1では登録できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery chargeは1以外の値にしてください")
      end

      it "shipment_source_idが空だと登録できない" do
        @item.shipment_source_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment sourceを入力してください")
      end
      
      it "shipment_source_idが1では登録できない" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment sourceは1以外の値にしてください")
      end


      it "shipping_day_idが空だと登録できない" do
        @item.shipping_day_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping dayを入力してください")
      end
      
      it "shipping_day_idが1では登録できない" do
        @item.shipping_day_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping dayは1以外の値にしてください")
      end

      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end

      it "priceが文字や英字では登録できない" do
        @item.price = "あべ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは不正な値です")
      end

      it "priceが299以下だと登録できない"do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは300より大きい値にしてください")
      end
      
      it "priceが10000000以上だと登録できない"do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは9999999より小さい値にしてください")
      end
      
    end
  end
end