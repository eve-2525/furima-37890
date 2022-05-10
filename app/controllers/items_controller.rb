class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index_edit, only: [:edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if @item.purchase_record.blank?
      render :edit
    else
      redirect_to action: :index
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to action: :index
    end
  end

  def update
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

  def move_to_index_edit
    redirect_to action: :index if current_user.id != @item.user_id
  end

end
