class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
<<<<<<< HEAD
    @featured_items = Item.order("RANDOM()").limit(4)
=======
    @featured_items = Item.all.shuffle.take(5)
>>>>>>> 51b704f4a53077efb577cf6ed85387baf6b4e888
  end
end
