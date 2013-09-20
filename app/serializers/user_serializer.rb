class UserSerializer < ActiveModel::Serializer
  #To embed IDs instead of associations, simply use the embed class method:
  #embed :ids, include: true

  attributes :id,  :name, :avatar, :first_name, :last_name, :username, :gender#, :connected_users

  #add this line here to get embeding of IDs working
  #has_many :connected_users

  #has_many :user_connections

  #has_many :user_connections#, embed: :objects
end
