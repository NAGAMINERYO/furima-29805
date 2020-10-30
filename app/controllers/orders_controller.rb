class OrdersController < ApplicationController
  before_action :item_params_id, only: [:index, :create]
  def index
      @order = Order.new
    unless authenticate_user!
      root_path
    end

    if @item.purchaser.present?
      root_path
    end

    if current_user.id == @item.user_id
      root_path
    end
  end



  def create
    @order = OrderPurchaser.new(order_purchaser_params)
    if @order.valid?
      pay_item
      @order.save
      root_path
    else
      render :index
    end
  end

  private

  def order_purchaser_params
    params.permit(:postal_code, :prefectures, :municipality, :address, :building, :phone_number, :purchaser_id, :item_id, :token ,).merge(user_id: current_user.id)
  
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_purchaser_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_params_id
    @item = Item.find(params[:item_id])
  end

  def root_path
    return redirect_to root_path
  end



end
