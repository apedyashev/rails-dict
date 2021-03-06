RailsDict.ConnectionsSearchController = Ember.Controller.extend
  needs: "connections"

  searchTerm: ''
  usersShown: (->
     @get('allUsers')?.get('length')
  ).property('allUsers')
  usersTotal: (->
    # how to extract metadata from json: http://stackoverflow.com/a/18250428/2248909
    modelType = this.get('allUsers.type')
    this.get('store').typeMapFor(modelType).metadata.total
  ).property('allUsers')

  loggedUserConnections: (->
    # how to extract metadata from json: http://stackoverflow.com/a/18250428/2248909
    modelType = this.get('allUsers.type')
    this.get('store').typeMapFor(modelType).metadata.connected_user_ids
  ).property('allUsers.metadata')


  loggedUserRequestedConnections: (->
    # how to extract metadata from json: http://stackoverflow.com/a/18250428/2248909
    modelType = this.get('allUsers.type')
    this.get('store').typeMapFor(modelType).metadata.requested_connection_ids
  ).property('allUsers')

  actions:
    doSearch: ->
      console.log  'actions:doSearch'
      @get('store').findQuery('user', { query: @get('searchTerm')} ).then (people)=>
        console.log("Found " + people.get('length') + " people");
        @set 'allUsers', people
#        @set 'searchTerm', ''

    requestConnection: (userToBeConnected)->
      console.log 'requestConnection'
      @get('store').createRecord('user_connection', {connected_user_id: userToBeConnected.get('id')}).save().then =>
        userToBeConnected.set 'isLoggedUserRequestedConnection', true

        console.log 'saved'
        requestedConns = @get 'loggedUserRequestedConnections'
        console.log 'requestedConns', requestedConns
        requestedConns.push parseInt( userToBeConnected.get('id') )
        @set 'loggedUserRequestedConnections', requestedConns
        userToBeConnected.set 'loggedUserRequestedConnections', requestedConns
        console.log 'requestedConns', requestedConns

    #
    # Implements 'disconnecting' of users
    removeConnection: (user)->
      @get('controllers.connections').get('connections').filter (item, index, enumerable) =>
        console.log item.get('id')
        if parseInt( item.get('connected_user_id') ) is parseInt( user.get('id') )
          item.deleteRecord()
          item.save().then =>
            cons = @get 'loggedUserConnections'
            cons.splice( $.inArray(user.get('id'), cons), 1)
            @set 'loggedUserConnections', cons
            user.set 'loggedUserConnections', cons

      @get('connections').filter (item, index, enumerable) =>
        console.log item.get('id')


    removeConnection1: (connection)->
      @get('store').deleteRecord(connection)
      connection.deleteRecord()
      console.log connection

#  updateKey: (keyCode)->
#    console.log keyCode, @searchTerm
#    @get('store').findQuery('user', { firstName: "Peter" }).then (people)->
#      console.log("Found " + people.get('length') + " people named Peter.");