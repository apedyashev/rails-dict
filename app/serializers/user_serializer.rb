class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :avatar, :first_name, :last_name, :username, :gender
end
