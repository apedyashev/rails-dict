RailsDict.UsersSearchView = Ember.TextField.extend #Em.View.extend
  keyDown: (e)->
    this.get('controller').send('updateKey', e.keyCode);