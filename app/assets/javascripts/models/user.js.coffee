RailsDict.User = DS.Model.extend
  first_name: DS.attr('string')
  last_name: DS.attr('string')
  gender: DS.attr('string')
  avatar: DS.attr('string')
  requestSent: yes
  fullName: (->
    (@get('first_name') + ' ' + @get('last_name'))
  ).property('first_name', 'last_name')

  isMale: (->
    (@get('gender') is 'male')
  ).property('gender')

  isFemale: (->
#    console.log RailsDict.__container__.lookup("controller:connections").get('loggedUserConnections')#ConnectionsController.get('loggedUserConnections')
    (@get('gender') is 'female')
  ).property('gender')
#  connected_user_ids: DS.attr()


  loggedUserConnections: []#ConnectionsController.get('loggedUserConnections')
  loggedUserRequestedConnections: []

  isConnectedWithLoggedUser: (->
    _loggedUserConnections = RailsDict.__container__.lookup("controller:connections_search").get('loggedUserConnections')
#    console.log "<<>>", parseInt(@get('id')), _loggedUserConnections
    pos = $.inArray parseInt(@get('id')), _loggedUserConnections
    (pos isnt -1)
  ).property('loggedUserConnections')

  isLoggedUserRequestedConnection: (->
    _loggedUserRequestedConnections = RailsDict.__container__.lookup("controller:connections_search").get('loggedUserRequestedConnections')
    console.log '_loggedUserRequestedConnections', _loggedUserRequestedConnections
    pos = $.inArray parseInt(@get('id')), _loggedUserRequestedConnections
    (pos isnt -1)
  ).property('loggedUserRequestedConnections')

  #relationships
#  userConnections: DS.hasMany('user_connection')

