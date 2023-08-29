class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @item = Item.find(params[:item_id])
    @offer = Offer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @offer = Offer.new(offer_params)
    @offer.item = @item
    @offer.user = current_user

    if @offer.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:price)
  end

end
