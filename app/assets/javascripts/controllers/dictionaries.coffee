RailsDict.DictionariesController = Ember.Controller.extend
  phrase: ''
  translation: ''

  save: ->
    console.log @phrase, @translation
