RailsDict.UsersSearchView = Ember.TextField.extend #Em.View.extend
  didInsertElement: ->
    this.$().focus()

#  keyDown: (e)->
#    console.log e, @get('controller')
#    @get('controller').send('updateKey', e.keyCode)

