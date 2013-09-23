class SessionsController < Base::UserController
  def new
    @title = "Login"
    @activity_logger.log_login_page_view data: {}
  end

  def create
    auth_hash = request.env['omniauth.auth']


    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)

      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
      @activity_logger.set_user_id session[:user_id]
      @activity_logger.log_login_success data: {:auth_hash => auth_hash}
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      @activity_logger.set_user_id auth.user.id
      @activity_logger.log_login_success data: {:auth_hash => auth_hash }

      # Create the session
      session[:user_id] = auth.user.id

      #render :text => "Welcome #{auth.user.name}!"

      redirect_to '/dictionaries'
    end
  end

  def failure
    @activity_logger.log_login_failure data: {}
  end
end
