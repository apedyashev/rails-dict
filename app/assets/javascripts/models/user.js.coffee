RailsDict.User = DS.Model.extend
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  email: DS.attr('string')
  gender: DS.attr('string')
  avatar: DS.attr('string')
  fullName: (->
    @get('firstName') + ' ' + @get('lastName')
  ).property('firstName', 'lastName')

  isMale: (->
    (@get('gender') is 'male')
  ).property('gender')
  isFemale: (->
    (@get('gender') is 'female')
  ).property('gender')
