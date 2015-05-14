require 'yelp'

helpers do
  YOUR_CONSUMER_KEY = "jeo_AxMxHABXBSbjp3c05w"
  YOUR_CONSUMER_SECRET = "aTEPrIsUilZdFQ30sUe6Noi6GAQ"
  YOUR_TOKEN = "p6hEekCEwziuxfFNjJNdrPUy8HERbyq_"
  YOUR_TOKEN_SECRET = "TXM0ZaKL8ZVYVMwCycRh54Hra8c"
  def around_here(args)



    client = Yelp::Client.new({ consumer_key: YOUR_CONSUMER_KEY,
                                consumer_secret: YOUR_CONSUMER_SECRET,
                                token: YOUR_TOKEN,
                                token_secret: YOUR_TOKEN_SECRET
                              })

    client.search(args[:city], args[:params])
  end
end