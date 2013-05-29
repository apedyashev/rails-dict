RailsDict.ConnectionsRoute = Ember.Route.extend
#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    controller.set 'title', 'Home'

  renderTemplate: ->
    @render
      outlet: 'main'