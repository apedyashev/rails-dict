RailsDict.ConnectionsController = Ember.Controller.extend
  searchTerm: ''

  updateKey: (keyCode)->
    console.log keyCode, @searchTerm
#    RailsDict.Store.findQuery('user', { firstName: "Peter" }).then (people)->
#      console.log("Found " + people.get('length') + " people named Peter.");