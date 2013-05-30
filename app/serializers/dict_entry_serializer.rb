class DictEntrySerializer < ActiveModel::Serializer
  attributes :id, :phrase, :translation
end
