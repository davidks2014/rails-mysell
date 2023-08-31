class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @featured_items = Item.all.shuffle.take(4)
    @user = current_user
  end
end
