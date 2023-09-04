class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @featured_items = Item.all.shuffle.take(6)
    @user = current_user
  end

  def offers
    @user = current_user
    @offers = policy_scope(Offer).all
  end

  def approve
    @offer = Offer.find(params[:offer_id])
    @item = @offer.item
    # Add logic to approve the offer
    if @offer.update(status: 'Offer accepted')
      @item.update(status: 'sold')
    end
    redirect_to item_path(@item), notice: "Offer approved successfully"
  end

  def decline
    @offer = Offer.find(params[:offer_id])
    @item = @offer.item
    # Add logic to decline the offer
    @offer.update(status: 'Offer declined')
    redirect_to item_path(@item), notice: "Offer declined successfully"
  end
end
