class BuysController < ApplicationController

  def index
    @buy = Buy.new
    @item = Item.find(params[:item_id])
  end

  def new

  end

  def create

  end

end
