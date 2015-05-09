get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :new_event
end

post '/events/create' do
  @event = Event.new(
    title: params[:title],
    date: params[:date],
    organizer_name: params[:name],
    organizer_email: params[:email],
  )

  if @event.save
    redirect to('/')
  else
    status 400
    erb :"new_event"
  end
end
