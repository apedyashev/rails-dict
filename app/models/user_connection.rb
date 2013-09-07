class UserConnection < ActiveRecord::Base
  attr_accessible :connected_user_id, :is_connection_accepted, :user_id
end
