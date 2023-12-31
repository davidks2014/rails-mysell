class OffersController < ApplicationController
  # def index
  #   @item = Item.find(params[:item_id])
  #   @offers = policy_scope(Offer)
  #   # if @item.user == current_user
  #   #   @offers = @item.offers
  #   # else
  #   #   @offers = @item.offers.select{|o| o.user == current_user}
  #   # end
  # end

  def new
    @item = Item.find(params[:item_id])
    @offer = Offer.new
    authorize @offer
  end

  def create
    @item = Item.find(params[:item_id])
    @offer = Offer.new(offer_params)
    @offer.item = @item
    @offer.user = current_user
    authorize @offer

    if @offer.save
      redirect_to item_path(@item)
    else
      render 'items/show', status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @item = Item.find(params[:item_id])
    @offer = Offer.find(params[:id])
    authorize @offer
    if @offer.update(offer_params)
      redirect_to @item, notice: "Offer was successfully updated."

      @offer.update(status: "pending") # update the status of the offer to pending in case the previous offer was declined

    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :status)
  end
end
