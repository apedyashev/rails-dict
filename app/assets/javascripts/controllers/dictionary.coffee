RailsDict.DictionaryController = Ember.Controller.extend
  phrase            : ''
  translation       : ''
  phraseValid       : yes
  translationValid  : yes

  actions:
    ##
    # This function is binded to the 'Save' button click
    ##
    save: (entry)->

      isNewEntry = yes
      if entry?
        isNewEntry  = false
        newRecord   = entry
      else
        # create new record and fill it with data from form
        store = @get('store')
  #      newRecord = RailsDict.DictEntry.createRecord
        newRecord = store.createRecord 'dict_entry',
          phrase: @phrase
          translation: @translation

      #validate created record
      ## @todo: uncomment affter cocher validation is added
  #    newRecord.validate().then =>
  #      isValid = newRecord.get 'isValid'
      if isNewEntry
        isValid = (@phrase isnt '') and (@translation isnt '')
      else
        isValid = (newRecord.get('phrase') isnt '') and (newRecord.get('translation') isnt '')
      if isValid
        #validation passed. save data on the server
        newRecord.save().then =>
          if isNewEntry
            unless newRecord.get 'isDirty'
              @set 'phrase', ''
              @set 'translation', ''
          else
            newRecord.set 'isEditMode', no
      else
        #there are validation errors. delete record
        if isNewEntry
          newRecord.deleteRecord()
        if isNewEntry
          @set 'phraseValid', no
          @set 'translationValid', no
        else
          newRecord.set 'isPhraseValid',      no
          newRecord.set 'isTranslationValid', no

        ## @todo: uncomment affter cocher validation is added

#        #
#        # reflect validation errors in the view
#        #
#
#        #get error messages
#        phraseValidationMessage       = newRecord.errors.get('phrase')
#        translationValidationMessage  = newRecord.errors.get('translation')
#
#        #@todo: add displaying of validation errors
#
#        #
#        # set binded vars to true or false
#        #
#
#        if isNewEntry
#          @set 'phraseValid', (phraseValidationMessage is undefined)
#          @set 'translationValid', (translationValidationMessage is undefined)
#        else
#          newRecord.set 'isPhraseValid',      (phraseValidationMessage is undefined)
#          newRecord.set 'isTranslationValid', (translationValidationMessage is undefined)
#

#    ,(error)->
#      console.log 'fail', error

    ##
    # This function is binded on click on the 'edit' icon
    ##
    edit: (entry)->
      entry.set 'isEditMode', yes

    ##
    # This function is binded on click on the 'remove' icon
    ##
    remove: (entry)->
      entryId =  entry.get 'id'
      if confirm "You are about to delete an entry ##{entryId}. Are you sure?"
        entry.deleteRecord()
        entry.save()

    ##
    # This function is binded on click on the 'Cancel entry edit mode' button
    ##
    cancelEditMode: (entry)->
      entry.set 'isEditMode', no
      #undo changes which haven't been saved
      entry.get("transaction").rollback()