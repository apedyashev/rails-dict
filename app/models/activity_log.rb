class ActivityLog < ActiveRecord::Base
  attr_accessible :action, :ip_addr, :url, :x_ip_addr
end
