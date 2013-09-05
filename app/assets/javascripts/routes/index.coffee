##
#  The only purpose of this route is to redirect from index to dictionaries
##
RailsDict.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('dictionaries')