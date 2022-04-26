class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
    @items = Item.all
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

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :state_id, :delivery_fee_id, :province_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
