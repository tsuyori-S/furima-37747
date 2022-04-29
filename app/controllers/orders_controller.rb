class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_info

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_info
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :province_id, :city, :house_number, :building, :phone_number).merge(order_id: order.id)
  end
end
