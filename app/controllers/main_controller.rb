class MainController < Base::UserController
  def index

    @avatar = 'avatar.jpg'
    if session[:user_id]
        @is_logged_in = true
        gon.loggedUser = User.find session[:user_id]
    else
      redirect_to '/sessions/new'
    end
  end
end
