class OrdersController < ApplicationController

  def index
    @order = order.new
  end

  def create
    # @donation = Donation.create(donation_params)
    # Address.create(address_params)
    # redirect_to root_path
  end

end
