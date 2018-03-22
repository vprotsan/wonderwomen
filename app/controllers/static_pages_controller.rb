class StaticPagesController < ApplicationController
  def homes
    @products = Product.all.sample(3)

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
