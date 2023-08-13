class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    if current_user.id == @item.user.id
      render :edit
    else
      redirect_to '/'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless user_signed_in? && current_user.id == @item.user.id

    @item.destroy
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :cost_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
