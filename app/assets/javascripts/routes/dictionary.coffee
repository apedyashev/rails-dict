RailsDict.DictionaryRoute = Ember.Route.extend

  model: (params)->
    if params.dict_id is 'all'
      return @get('store').find('dictionary')
    else
      return @get('store').find('dictionary', params.dict_id)


  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller, model)->
    controller.set 'words', @get('store').findQuery('dict_entry', {dictionary_id: model.get('id')} )
    controller.set 'dictionary', model

  renderTemplate: ->
    @render
      outlet: 'main'


RailsDict.DictionaryDictsRoute = Ember.Route.extend
  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    controller.set 'dictionaries', @get('store').find('dictionary')

  renderTemplate: ->
    @render
      outlet: 'dictwidgets'



RailsDict.DictionaryCollaboratorsRoute = Ember.Route.extend
  model: (params)->
    return @get('store').find('dictionary', params.dict_id)

  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller, model)->
    controller.set 'collaborators', @get('store').findQuery('collaborator', {dictionary_id: @controllerFor('dictionary').get('dictionary').get('id')} )

  renderTemplate: ->
    @render
      outlet: 'dictwidgets'



RailsDict.DictionariesRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'dictionaries', @get('store').findQuery('dictionary', {is_public: true})