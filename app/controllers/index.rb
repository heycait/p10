get '/' do
  if logged_in?
    erb :"users/homepage"
  else
    erb :index
  end
end

get '/homepage' do
  @events = Event.all
  if logged_in?
    erb :"users/homepage"
  else
    status 400
    "Please signup/login first."
  end
end