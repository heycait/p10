require 'yelp'

helpers do

  def yelp_client
    @yelp_client ||= Yelp::Client.new({
      consumer_key: YELP_CONSUMER_KEY,
      consumer_secret: YELP_CONSUMER_SECRET,
      token: YELP_TOKEN,
      token_secret: YELP_TOKEN_SECRET
    })
  end

  def around_here(args)
    client.search(args[:city], args[:params]={})
  end
end
