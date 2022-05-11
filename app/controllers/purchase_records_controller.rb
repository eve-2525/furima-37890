class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :destroy, :index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(address_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:order).permit(:postal_code, :area_id, :city, :block_number, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to items_path if @item.purchase_record.blank?
  end
end

def set_item
  @item = Item.find(params[:item_id])
end
