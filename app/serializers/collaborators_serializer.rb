class CollaboratorsSerializer < ActiveModel::Serializer
  attributes :id, :can_edit

  has_one :user
end
