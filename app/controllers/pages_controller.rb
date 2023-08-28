class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @featured_items = Item.all.shuffle.take(5)
  end
end
