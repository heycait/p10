require 'yelp'

helpers do
  YELP_CONSUMER_KEY = "jeo_AxMxHABXBSbjp3c05w"
  YELP_CONSUMER_SECRET = "aTEPrIsUilZdFQ30sUe6Noi6GAQ"
  YELP_TOKEN = "p6hEekCEwziuxfFNjJNdrPUy8HERbyq_"
  YELP_TOKEN_SECRET = "TXM0ZaKL8ZVYVMwCycRh54Hra8c"

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