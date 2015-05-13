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

get '/events/:id' do
  @event = Event.where(id: params[:id]).first

  erb :"events/your_event"
end

get '/events/:id/show' do
  @event = Event.where(id: params[:id]).first
  @creator = User.where(id: @event.user_id).first if @event

  if @event
    erb :"events/show_event"
  else
    "This is not the event you are looking for. Move along."
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
    # params.inspect
    redirect to("/events/#{@event.id}")
  else
    status 400
    erb :"events/new_event"
  end
end
