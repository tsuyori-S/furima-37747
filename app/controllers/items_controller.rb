class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :user_mismatch, only: [:edit, :destroy]


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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def user_mismatch
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :state_id, :delivery_fee_id, :province_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
