class OffersController < ApplicationController
  def index
    @offers = Offer.all
    authorize @offer
  end

  def new
    @item = Item.find(params[:item_id])
    @offer = Offer.new
    raise
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

  def edit
    @item = Item.find(params[:item_id])
    @offer = Offer.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to @item, notice: "Offer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :status)
  end

end
