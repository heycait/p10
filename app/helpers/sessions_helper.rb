helpers do

  def login(user)
    session[:id] = user.id
  end

  def logout!
    session.clear
  end

  def current_user
    if session[:id]
      @current_user ||= User.where(id: session[:id]).first
    end
  end

  def logged_in?
    current_user.present?
  end

end
