class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @featured_items = Item.all.shuffle.take(4)
    @user = current_user
  end

  def offers
    @user = current_user
    @offers = policy_scope(Offer).all
  end

  def approve
    # raise
    @offer = Offer.find(params[:offer_id])
    @item = @offer.item
    # Add logic to approve the offer
    if @offer.update(status: 'Offer acepted')
      @item.update(status: 'Sold')
    end
    redirect_to offers_path, notice: "Offer approved successfully"
  end

  def decline
    @offer = Offer.find(params[:offer_id])
    # Add logic to decline the offer
    @offer.update(status: 'Offer declined')
    redirect_to user_offers_path, notice: "Offer declined successfully"
  end
end
