RailsDict.ConnectionsSearchRoute = Ember.Route.extend
  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    store = @get('store')
    store.findQuery('user', { query: controller.get('searchTerm')} ).then (users)->
      controller.set 'allUsers', users
#      controller.set 'usersShown', users.get('length')

  renderTemplate: ->
    @render outlet: 'conn_search'

