class BuysController < ApplicationController

  def index
    @buy_delivery = BuyDelivery.new
    @item = Item.find(params[:item_id])
  end

  def new
    @buy_delivery = BuyDelivery.new
  end

  def create
    # binding.pry
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      @buy_delivery.save
      return redirect_to '/'
    else
      render :index, status: :unprocessable_entity
    end
  end

private
  def buy_params
    params.require(:buy_delivery).permit(:item_id, :postcode, :area_id, :city, :address, :building, :telephone).merge(user_id: current_user.id).merge(token: params[:token])
  end

end
