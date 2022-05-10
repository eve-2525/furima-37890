class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :destroy, :index]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @order = Order.new(address_params)
    @item = Item.find(params[:item_id])
    if 
      @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end

  end


  private

  def address_params
    params.require(:order).permit(:postal_code, :area_id, :city, :block_number, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
