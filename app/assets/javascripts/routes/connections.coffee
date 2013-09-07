RailsDict.ConnectionsRoute = Ember.Route.extend
#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
#    controller.set 'title', 'Home'
    controller.set 'model', RailsDict.UserConnection.find()
    controller.set 'allUsers', RailsDict.User.find()

  renderTemplate: ->
    @render
      outlet: 'main'