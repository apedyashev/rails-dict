RailsDict.Router.map (match)->
#  match('/').to('dictionaries')
  @route 'login'
  @resource 'connections', ->
    @route '/'
    @route 'search'
  @resource 'dictionaries', ->
    @route 'dicts'
    @route 'collaborators'


RailsDict.Router.reopen
  location: 'history'

