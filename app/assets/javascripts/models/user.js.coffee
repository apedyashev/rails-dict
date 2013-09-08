RailsDict.User = DS.Model.extend
  first_name: DS.attr('string')
  last_name: DS.attr('string')
  gender: DS.attr('string')
  avatar: DS.attr('string')
  requestSent: yes
  fullName: (->
    (@get('first_name') + ' ' + @get('last_name'))
  ).property('first_name', 'last_name')

  isMale: (->
    (@get('gender') is 'male')
  ).property('gender')

  isFemale: (->
    (@get('gender') is 'female')
  ).property('gender')
