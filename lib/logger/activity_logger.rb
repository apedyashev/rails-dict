class ActivityLogger

  def log(params)
      params[:ip_addr]    = '127.0.0.1'
      params[:x_ip_addr]  = '192.168.0.1'
      params[:url]        = '/dicts'

      act_log = ActivityLog.new params
      act_log.save
  end
end