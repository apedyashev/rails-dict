RailsDict.Router.map (match)->
#  match('/').to('dictionaries')
  @route 'login'
  @route 'connections'
  @resource 'dictionaries', ->
    @route 'dicts'
    @route 'collaborators'


RailsDict.Router.reopen
  location: 'history'

