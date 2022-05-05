class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Iitem.all
  end
  
  def create
  end

end
