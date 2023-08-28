class ItemsController < ApplicationController
  def index
    @items = Item.all

    if params[:search]
      @items = Item.where("name LIKE ?", "%#{ params[:search][:query]}%")
    end
  end
end
