class DictEntry < ActiveRecord::Base
  validates  :phrase, :translation, presence: true
  attr_accessible :phrase, :translation
end
