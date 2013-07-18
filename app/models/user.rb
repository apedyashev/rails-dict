class User < ActiveRecord::Base
  has_many :authentications

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable
  # attr_accessible :title, :body

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_omniauth(omni)
    authentications.build(:provider => omni['provider'],
                          :uid => omni['uid'],
                          :token => omni['credentials'].toke,
                          :token_secret => omni['credentials'].secret)
  end
end
