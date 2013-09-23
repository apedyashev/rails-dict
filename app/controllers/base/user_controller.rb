class Base::UserController < ApplicationController
    before_filter :initialize_user

    protected
    def initialize_user
      #initialize activity logger
      @activity_logger = ActivityLogger.new
      @activity_logger.set_user_id(session[:user_id])
      @activity_logger.set_ip_addr(request.remote_ip )
      @activity_logger.set_x_ip_addr( request.env["HTTP_X_FORWARDED_FOR"] )
      @activity_logger.set_user_agent( request.env['HTTP_USER_AGENT'] )
    end
end
