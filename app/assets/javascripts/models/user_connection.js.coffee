RailsDict.UserConnection = DS.Model.extend
#  user_id: DS.attr('number')
  connected_user_id: DS.attr('number')
  is_connection_accepted: DS.attr('boolean')
  connected_user: DS.attr()

  #relationships
  post: DS.belongsTo('user')
