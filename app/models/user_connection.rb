class UserConnection < ActiveRecord::Base
  attr_accessible :connected_user_id, :is_connection_accepted, :user_id

  belongs_to :connected_user, class_name: "User", foreign_key: "connected_user_id"


  def self.get_connected_user_ids(user_id)
    where("user_connections.user_id = ?", "#{user_id}").where("user_connections.is_connection_accepted = ?", true).pluck(:connected_user_id)
  end

  def self.get_requested_connection_ids(user_id)
    where("user_connections.user_id = ?", "#{user_id}").where("user_connections.is_connection_accepted = ?", false).pluck(:connected_user_id)
  end
end
