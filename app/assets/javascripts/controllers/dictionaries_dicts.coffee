RailsDict.DictionariesDictsController = Ember.Controller.extend
  isEditMode: no
  editModeIsPublicVisibility: no

  _isEditModeIsPublicVisibilityChanged: ->
    console.log 'changed'

  actions:
    createNew: ->
      console.log 'creating a new dict'
      @set 'isEditMode', yes