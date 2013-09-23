class DictionarySerializer < ActiveModel::Serializer
  attributes :id, :language1, :language2, :is_public, :user_id

  has_one :user
end
