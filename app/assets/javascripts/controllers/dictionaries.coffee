RailsDict.DictionariesController = Ember.Controller.extend
  phrase: ''
  translation: ''

  save: ->
    newRecord = RailsDict.DictEntry.createRecord
      phrase: @phrase
      translation: @translation

    newRecord.validate().then ->
      isValid = newRecord.get 'isValid'
      console.log 'isValid', isValid
      newRecord.save() if isValid
    , (error)->
      console.log 'fail', error
#      isValid = @get('isValid')

      console.log 'isValid', @get('isValid')