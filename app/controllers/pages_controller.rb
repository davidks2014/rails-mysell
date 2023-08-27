class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @featured_products = Product.where(featured: true).limit(4)
  end
end
