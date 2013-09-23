RailsDict.Dictionary = DS.Model.extend Ember.Validations.Mixin,
  language1:        DS.attr('string')
  language2:        DS.attr('string')
  is_public:        DS.attr('boolean')
  collaborators:    DS.hasMany('collaborator')
  collaboratorIds:  DS.attr()
  user:             DS.attr()


