class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @featured_items = Item.order("RANDOM()").limit(4)
  end
end
