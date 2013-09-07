class ActivityLogger
  ACTION_ADD_WORD_OK    = 'awdok'
  ACTION_ADD_WORD_FAIL  = 'awdfail'
  ACTION_DELETE_WORD    = 'delwd'

  #
  # sets user_id (must be called when logger is initialized)
  def set_user_id(user_id)
    @user_id  = user_id
  end

  #
  # sets ip_addr (must be called when logger is initialized)
  def set_ip_addr(ip_addr)
    @ip_addr = ip_addr
  end

  #
  # sets x_ip_addr (must be called when logger is initialized)
  def set_x_ip_addr(x_ip_addr)
    @x_ip_addr = x_ip_addr
  end


  #
  # logs 'new word added succefully' action
  def log_add_word_ok(params)
    params[:action] = ACTION_ADD_WORD_OK
    self.log params
  end

  #
  # logs 'new word add failed' action
  def log_add_word_fail(params)
    params[:action] = ACTION_ADD_WORD_FAIL
    self.log params
  end

  #
  # logs 'delete word' action
  def log_delete_word(params)
    params[:action] = ACTION_DELETE_WORD
    self.log params
  end


  #
  # writes all fields to DB
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