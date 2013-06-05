RailsDict.DictionariesController = Ember.Controller.extend
  phrase: ''
  translation: ''
  phraseValid: yes
  translationValid: yes

  save: ->
    #@todo: add good validation
    if (@phrase.length > 0) and (@translation.length > 0)
      newRecord = RailsDict.DictEntry.createRecord
        phrase: @phrase
        translation: @translation
      newRecord.save().then =>
          @set 'phrase', ''
          @set 'translation', ''
      , (e)->
        console.log '********', e

    #@todo: temporary solution. add kosher validation
    @set 'phraseValid', (@phrase.length > 0)
    @set 'translationValid', (@translation.length > 0)

#    newRecord.validate().then ->
#      isValid = newRecord.get 'isValid'
#      console.log 'isValid', isValid
#      newRecord.save() if isValid
#    ,(error)->
#      console.log 'fail', error