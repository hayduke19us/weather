module Authentication
  def authenticate!
    unless session[:user_id]
      session[:original_request] = request.path_info
      redirect '/'
    end
  end

  def current_user
    @current_user ||= User.find id: session[:user_id]
  end

  def confirm_password pass, pass_confirm
    pass == pass_confirm ? true : false
  end

  module Test
    def current_user
      @current_user ||= User.find id: last_request.session[:user_id]
    end
  end
end
