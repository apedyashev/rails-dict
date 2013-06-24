RailsDict.DictionariesController = Ember.Controller.extend
  phrase: ''
  translation: ''
  phraseValid: yes
  translationValid: yes

  ##
  # This function is binded to the 'Save' button click
  ##
  save: ->
    # create new record and fill it with data from form
    newRecord = RailsDict.DictEntry.createRecord
      phrase: @phrase
      translation: @translation

    #validate created record
    newRecord.validate().then =>
      isValid = newRecord.get 'isValid'
      if isValid
        #validation passed. save data on the server
        newRecord.save().then =>
          unless newRecord.get 'isDirty'
            @set 'phrase', ''
            @set 'translation', ''
      else
        #there are validation errors. delete record
        newRecord.deleteRecord()

      #
      # reflect validation errors in the view
      #

      #get error messages
      phraseValidationMessage       = newRecord.errors.get('phrase')
      translationValidationMessage  = newRecord.errors.get('translation')

      #@todo: add displaying of validation errors

      #set binded vars to true or false
      @set 'phraseValid', (phraseValidationMessage is undefined)
      @set 'translationValid', (translationValidationMessage is undefined)
    ,(error)->
      console.log 'fail', error

  ##
  # This function is binded on click on the 'edit' icon
  ##
  edit: (entry)->
    console.log 'edit', entry.get 'phrase'

  ##
  # This function is binded on click on the 'remove' icon
  ##
  remove: (entry)->
    console.log 'remove', entry.get 'id'