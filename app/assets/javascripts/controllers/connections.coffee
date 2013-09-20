RailsDict.ConnectionsController = Ember.Controller.extend
  needs: "connectionsSearch"

  actions:
    remove: (connection)->
      #find user  in the 'search users' list
      user = @get('controllers.connectionsSearch').get('allUsers').find (item)->
        parseInt( item.get('id') ) is parseInt( connection.get('connected_user_id') )

      console.log user

      connection.deleteRecord()
      connection.save().then =>
        user.set 'isConnectedWithLoggedUser', false
        user.set 'isLoggedUserRequestedConnection', false
