class ItemsController < ApplicationController
  def index
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :cost_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
