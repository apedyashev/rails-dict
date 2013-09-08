RailsDict.ConnectionsController = Ember.Controller.extend
  searchTerm: ''
  usersShown: (->
     @get('allUsers')?.get('length')
  ).property('allUsers')
  usersTotal: (->
    # how to extract metadata from json: http://stackoverflow.com/a/18250428/2248909
    modelType = this.get('allUsers.type')
    this.get('store').typeMapFor(modelType).metadata.total
  ).property('allUsers')

  actions:
    doSearch: ->
      console.log  'actions:doSearch'
      @get('store').findQuery('user', { query: @get('searchTerm')} ).then (people)=>
        console.log("Found " + people.get('length') + " people");
        @set 'allUsers', people
#        @set 'searchTerm', ''


#  updateKey: (keyCode)->
#    console.log keyCode, @searchTerm
#    @get('store').findQuery('user', { firstName: "Peter" }).then (people)->
#      console.log("Found " + people.get('length') + " people named Peter.");