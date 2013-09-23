class Collaborators < ActiveRecord::Base
  attr_accessible :dictionary_id, :user_id, :can_edit

  belongs_to :user
end
