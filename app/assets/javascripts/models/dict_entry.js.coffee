RailsDict.DictEntry = DS.Model.extend Ember.Validations.Mixin,
  phrase:             DS.attr('string')
  translation:        DS.attr('string')

  isPhraseValid:      yes
  isTranslationValid: yes


