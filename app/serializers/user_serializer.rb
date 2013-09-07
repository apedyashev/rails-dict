class UserSerializer < ActiveModel::Serializer
  attributes :id,  :name, :avatar, :first_name, :last_name, :username, :gender
end
