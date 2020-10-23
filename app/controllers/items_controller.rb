class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to item_path(@item) unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private

  def item_params
    params.require(:item)
          .permit(:name, :image, :description, :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :shipping_day_id, :price)
          .merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
