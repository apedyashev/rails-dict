RailsDict.DictionaryDictsController = Ember.Controller.extend
  lang1: ''
  lang2: ''
  lang1Valid: (->
    (@get('lang1') isnt '')
  ).property('lang1')
  lang2Valid: (->
    (@get('lang2') isnt '')
  ).property('lang2')

  editModeIsPublicVisibility: no

  isEditMode: no
  connections: null

  #http://stackoverflow.com/questions/10383882/selectionbinding-for-checkbox-in-emberjs
  _isEditModeIsPublicVisibilityChanged: (->
    console.log 'changed'
    if @get 'editModeIsPublicVisibility'
      unless @get('connections')
        connections = @get('store').find('user_connection')
        @set 'connections', connections

  ).observes('editModeIsPublicVisibility')

  actions:
    createNew: ->
      @set 'isEditMode', yes

    cancelEditMode: ->
      @set 'isEditMode', no

    addUserToCollaborators: (connection)->
      $('span.tooltip').remove()
      isSelected = connection.get 'isSelected'
      connection.set 'isSelected', !isSelected

    toggleCanEditProp:  (connection)->
      $('span.tooltip').remove()
      canEdit = connection.get 'canEdit'
      connection.set 'canEdit', !canEdit

    saveDictionary: ->
      if @get('lang1Valid') and @get('lang2Valid')
        collaboratorIds = []

        if @get('editModeIsPublicVisibility') is yes
          @get('connections').forEach (item) =>
            if (item.get('isSelected') is true)
              collaboratorIds.push
                user_id: item.get('connected_user_id')
                can_edit: item.get('canEdit')

        console.log 'collaboratorIds', collaboratorIds

        newRecord = @get('store').createRecord 'dictionary',
          language1:  @lang1
          language2:  @lang2
          is_public:  @editModeIsPublicVisibility
          collaboratorIds: collaboratorIds

        newRecord.save().then =>
              @set 'lang1', ''
              @set 'lang2', ''
              @set 'isEditMode', no
      else
