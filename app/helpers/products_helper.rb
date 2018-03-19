module ProductsHelper

  def self.yelp(lat,long)
    puts "before header lan and long here, #{lat}, #{long}"

    headers = {
      "Authorization"  => "Bearer fJ_tV36-84JlZ2YKTFAoWkrnrS4PUYmLUx2ieD8IIxOgRg5iH4zChQs4YX3Vb7ZY3OzE0E1c8Z_aXsuF4ZkVquRtupCIMQqIENjaIlVVMJhp70fDm3fQVuT7DfyvWnYx",
      "Cache-Control" => "no-cache",
      "Postman-Token" => "402ab387-fcfa-44d0-bcbb-761f59c442d2"
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
