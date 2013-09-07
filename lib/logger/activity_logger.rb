class ActivityLogger

  def set_user_id(user_id)
    @user_id  = user_id
  end

  def set_ip_addr(ip_addr)
    @ip_addr = ip_addr
  end


  def set_x_ip_addr(x_ip_addr)
    @x_ip_addr = x_ip_addr
  end

  def log(params)
      params[:ip_addr]    = @ip_addr
      params[:x_ip_addr]  = @x_ip_addr
      params[:url]        = '/dicts'

      #request = ActionDispatch::Request.new(ENV)
      #raise request.to_yaml
      params[:user_id]    = @user_id

      act_log = ActivityLog.new params
      act_log.save
  end
end