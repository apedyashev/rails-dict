RailsDict.DictionariesRoute = Ember.Route.extend
#  model: ->
#    RailsDict.DictEntry.find()

#If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    controller.set 'model', @get('store').find('dict_entry') #RailsDict.DictEntry.find()

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