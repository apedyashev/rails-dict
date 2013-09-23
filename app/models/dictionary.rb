class Dictionary < ActiveRecord::Base
  attr_accessible :is_public, :language1, :language2, :user_id

  belongs_to :user
end
