module Authentication
  def authenticate!
    unless session[:user_id]
      session[:original_request] = request.path_info
      redirect '/'
    end
  end

  def current_user
    session       ||= last_request.env['rack.session']
    @current_user ||= User.find id: session[:user_id]
  end
end
