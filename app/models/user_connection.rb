class UserConnection < ActiveRecord::Base
  attr_accessible :connected_user_id, :is_connection_accepted, :user_id

  belongs_to :connected_user, class_name: "User", foreign_key: "connected_user_id"
end
