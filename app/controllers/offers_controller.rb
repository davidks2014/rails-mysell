class OffersController < ApplicationController
  def new
    @item = Item.find(params[:user_id])
    @offer = Offer.new
  end
end
