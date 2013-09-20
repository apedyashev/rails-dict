class User < ActiveRecord::Base
  attr_accessible :email, :name, :avatar, :first_name, :last_name, :username, :gender

  has_many :authorizations
  has_many :user_connections
  has_many :connected_users, :through => :user_connections, :conditions => {:user_connections => {:is_connection_accepted => true}}
  #class_name: "UserConnection", through: :user_connections, source: :user , foreign_key: "connected_user_id"#, far_key: "connected_user_id"

  validates :name, :email, :presence => true


  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end

end
