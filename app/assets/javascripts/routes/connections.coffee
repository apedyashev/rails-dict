RailsDict.ConnectionsRoute = Ember.Route.extend
#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
#    if controller.get 'isSearchVisible'
#      controller.transitionToRoute 'connections.search'
#    else
#      controller.transitionToRoute 'connections'

    controller.set 'connections',  @get('store').find('user_connection')
#    console.log controller.get 'connections'
#    store = @get('store')
#    store.findQuery('user_connection', { query: controller.get('searchTermConnection')} ).then (users)->
#      controller.set 'connections', users

  renderTemplate: ->
    @render
      outlet: 'main'
