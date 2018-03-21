module ProductsHelper

  def self.yelp(lat,long)
    puts "before header lan and long here, #{lat}, #{long}"

    headers = {
      "Authorization"  => ENV["YELP"]
      # "Cache-Control" => "no-cache"
    }

    if lat and long
      string = "https://api.yelp.com/v3/businesses/search?term=bakeries&latitude=" + lat.to_s + "&longitude="+ long.to_s
      puts string
    else
      string = "https://api.yelp.com/v3/businesses/search?term=bakeries"
    end

    # https://api.yelp.com/v3/businesses/search?term=bakeries&latitude=25.803059899999997&longitude=-80.2043643

    output = HTTParty.get(
      string,
      :headers => headers
    )
    puts " *** yelp output ***"
    p output
    puts " *** yelp output end  ***"
    # JSON.parse(output.body)
    output
  end
end
