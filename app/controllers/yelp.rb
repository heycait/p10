get '/yelp_search' do
  results = yelp_client.search_by_bounding_box(
    sw_latitude:  params[:sw_latitude],
    sw_longitude: params[:sw_longitude],
    ne_latitude:  params[:ne_latitude],
    ne_longitude: params[:ne_longitude],
  )
  results.to_json
end