class Collaborators < ActiveRecord::Base
  attr_accessible :dictionary_id, :is_read_only, :user_id
end
