RailsDict.ConnectionsRoute = Ember.Route.extend
#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
#    controller.set 'title', 'Home'
#    controller.set 'model', RailsDict.UserConnection.find()
#    controller.set 'allUsers', RailsDict.User.find()
    store = @get('store')

    store.findQuery('user_connection', { query: controller.get('searchTermConnection')} ).then (users)->
      controller.set 'connections', users

    store.findQuery('user', { query: controller.get('searchTerm')} ).then (users)->
      controller.set 'allUsers', users
#      controller.set 'usersShown', users.get('length')

  renderTemplate: ->
    @render
      outlet: 'main'
