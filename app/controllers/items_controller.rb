class ItemsController < ApplicationController
  def index
    # raise
    if params[:search]
      @items = Item.where("name LIKE ?", "%#{params[:search]}%")
    else
      @items = Item.all
    end
  end
end
