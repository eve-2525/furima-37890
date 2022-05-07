class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update

    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item.id)
  
      else
      render :edit
      end
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product, :product_description, :category_id, :condition_id, :postage_id, :area_id, :number_of_days_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if  user_signed_in? && current_user.id == @item.user_id
    elsif user_signed_in? && current_user.id != @item.user_id
      redirect_to action: :index
    else redirect_to action: :new
    end
  end

end
