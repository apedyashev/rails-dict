RailsDict.Router.map (match)->
#  match('/').to('dictionaries')
  @route 'login'
  @route 'dictionaries'
  @resource 'connections', ->
    @route 'search'
  @resource 'dictionary', { path: '/dictionary/:dict_id' }, ->
    @route 'dicts'
    @route 'collaborators'


RailsDict.Router.reopen
  location: 'history'

