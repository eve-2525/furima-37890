class PurchaseRecordsController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    binding.pry
    # @donation = Donation.create(donation_params)
    # Address.create(address_params)
    # redirect_to root_path
  end


  private

  def address_params
    # params.permit(:postal_code, :area_id, :city, :block_number, :building, :telephone_number, :item_id).merge(purchase_record_id: purchase_record.id)
  end

end
