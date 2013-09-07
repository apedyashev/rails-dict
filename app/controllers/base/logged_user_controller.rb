class Base::LoggedUserController < Base::UserController
     before_filter :initialize_user

    protected
    def initialize_user
      super

      unless session[:user_id]
        raise 'you must be logged user'
      end
    end
end
