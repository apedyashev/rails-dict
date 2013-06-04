RailsDict.DictionariesController = Ember.Controller.extend
  phrase: ''
  translation: ''

  save: ->
    console.log @phrase, @translation
    newRecord = RailsDict.DictEntry.createRecord
      phrase: @phrase
      translation: @translation
    newRecord.save()