class UserOffersController < ApplicationController
  def index
    @user = current_user
    @offers = policy_scope(Offer).all
  end

  def approve
    @offer = Offer.find(params[:id])
    # Add logic to approve the offer
    @offer.update(status: 'approved')
    redirect_to user_offers_path, notice: "Offer approved successfully"
  end

  def decline
    @offer = Offer.find(params[:id])
    # Add logic to decline the offer
    @offer.update(status: 'declined')
    redirect_to user_offers_path, notice: "Offer declined successfully"
  end
end
