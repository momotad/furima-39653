class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_delivery = BuyDelivery.new
  end

  def new
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      return redirect_to '/'
    else
      render :index, status: :unprocessable_entity
    end
  end

private
  def buy_params
    params.require(:buy_delivery).permit(:postcode, :area_id, :city, :address, :building, :telephone, :buy_id).merge(user_id: current_user.id).merge(token: params[:token]).merge(item_id: Item.find(params[:item_id]))
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || Buy.exists?(item_id: @item.id)
      redirect_to '/'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
