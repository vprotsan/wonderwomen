class StaticPagesController < ApplicationController
  def home
    @products = Product.all.sample(3)
  end

  def products
  end

  def contact
  end
end
