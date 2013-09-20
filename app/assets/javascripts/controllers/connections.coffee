RailsDict.ConnectionsController = Ember.Controller.extend
  actions:
    remove: (entry)->
#      @get('store').deleteRecord(connection)
      entry.deleteRecord()
      entry.save()
#      console.log connection
