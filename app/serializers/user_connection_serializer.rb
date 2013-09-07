class UserConnectionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :connected_user_id, :is_connection_accepted
end
