get '/users/new' do
  @user = User.new
  erb :"users/new_user"
end

get '/login/new' do
  if logged_in?
    redirect '/homepage'
  else
    erb :"users/login"
  end
end

post '/login' do
  @user = User.where(email: params[:email]).first
  if @user && @user.password == params[:password]
    login(@user)
    redirect '/homepage'
  elsif @user != true
    @error = "User does not exist"
    erb :"users/login"
  else
    status 400
    @error = 'Invalid email/password combination'
    erb :"users/login"
  end
end

get '/users/:id' do
  @user = User.where(id: params[:id]).first

  erb :"users/show_user"
end

post '/users' do
  @user = User.new(
      name: params[:name],
      email: params[:email],
  )
  @user.password = params[:password]

  if @user.save
    login(@user)
    "You signed up!"
    redirect '/homepage'
  else
    status 400
    erb :"users/new_user"
  end
end

get '/logout' do
  if logged_in?
    logout!
    redirect '/'
  else
    status 400
    "You ain't even logged in fool"
  end
end