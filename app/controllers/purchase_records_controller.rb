class PurchaseRecordsController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(address_params)
    @item = Item.find(params[:item_id])
    if 
      @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end

  end


  private

  def address_params
    params.require(:order).permit(:postal_code, :area_id, :city, :block_number, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
