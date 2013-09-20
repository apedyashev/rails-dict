RailsDict.DictionariesRoute = Ember.Route.extend

#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    controller.set 'words', @get('store').find('dict_entry')

  renderTemplate: ->
    @render
      outlet: 'main'


RailsDict.DictionariesDictsRoute = Ember.Route.extend
  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
#  setupController: (controller)->
#    controller.set 'isNoWidgetsSelected', false

  renderTemplate: ->
    @render
      outlet: 'dictwidgets'



RailsDict.DictionariesCollaboratorsRoute = Ember.Route.extend
#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
#  setupController: (controller)->
#    controller.set 'isNoWidgetsSelected', false

  renderTemplate: ->
    @render
      outlet: 'dictwidgets'