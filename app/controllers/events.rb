get '/events/:id/show' do |id|
  @event = Event.find(id)
  @creator = User.where(id: @event.user_id).first

  if @event && @creator
    erb :"events/show_event"
  else
    "Event doesn't exist"
  end
end

get '/events' do
  @events = Event.all
  erb :"events/all_events"
end

get '/events/new' do
  if current_user
    @event = Event.new
    erb :"events/new_event"
  else
    "Please login in first to create an event"
  end
end

post '/events' do
  @event = Event.new(
    title: params[:title],
    date: params[:date],
    time: params[:time],
    location: params[:location],
    description: params[:description],
    user_id: params[:user],
    cost: params[:cost],
  )
  if @event.save
    "You just saved an event!"
    params.inspect
    # redirect to('/')
  else
    status 400
    erb :"events/new_event"
  end
end
