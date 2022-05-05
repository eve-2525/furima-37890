class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :destroy, :new, :edit]

  def index
    @items = Item.order("created_at DESC")
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

  def item_params
    params.require(:item).permit(:product,:product_description,:category_id,:condition_id,:postage_id,:area_id,:number_of_days_id,:price,:image).merge(user_id: current_user.id)
  end

end
