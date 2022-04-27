class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order('created_at DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update

  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :state_id, :delivery_fee_id, :province_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
