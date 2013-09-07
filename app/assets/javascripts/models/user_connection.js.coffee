RailsDict.UserConnection = DS.Model.extend
  userId: DS.attr('number')
  connectedUserId: DS.attr('number')
  isConnectionAccepted: DS.attr('boolean')
