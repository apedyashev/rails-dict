class MainController < ApplicationController
  def index
    #raise session.to_yaml
    if session[:user_id]
        @is_logged_in = true
    else
      redirect_to '/sessions/new'
    end
  end
end
