class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :destroy, :new, :edit]

  def index
  end

  def new
  end

  def create
  end

end
