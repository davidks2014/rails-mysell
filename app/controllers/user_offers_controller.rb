class UserOffersController < ApplicationController
  def index
    @offers = policy_scope(Offer).all
  end
