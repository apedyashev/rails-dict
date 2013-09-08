class UserConnectionSerializer < ActiveModel::Serializer
  attributes :id, :is_connection_accepted, :connected_user
end
