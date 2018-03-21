class StaticPagesController < ApplicationController
  def home
    if params[:search].present?
       @products = Product.where(name: params[:search])
    else
       # @products = Product.all.order("created_at DESC")
       @products = Product.all.sample(3)
    end

    #pinterest
    @pins = CLIENT.get_pins(query: 'cake')
    #end

    #yelp
    @yelp = Product.yelp(params[:lat], params[:long])
  
    if @yelp["error"] == nil
      render json: @yelp
    end
    #end
  end

  def products
  end

  def contact
  end
end
