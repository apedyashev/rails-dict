RailsDict.Collaborator = DS.Model.extend
  dictionary_id: DS.attr('number')
  user_id: DS.attr('number')
  can_edit: DS.attr('boolean')
  dictionary: DS.belongsTo('dictionary')
  user: DS.attr()
