class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # @item = Item.create params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :shipping_day_id, :price)
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      # @item = @room.messages.includes(:user)
      render :new
    end
  end


  private

  def item_params
  params.require(:item)
  .permit(:name, :image, :description, :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :shipping_day_id, :price)
  .merge(user_id: current_user.id)
  end

end
