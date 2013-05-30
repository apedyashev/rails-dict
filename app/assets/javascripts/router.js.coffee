RailsDict.Router.map (match)->
  # match('/').to('index')
  @route 'login'
  @route 'connections'
  @resource 'dictionaries', ->
    @route 'dicts'
    @route 'collaborators'


RailsDict.Router.reopen
  location: 'history'

