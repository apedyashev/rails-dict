RailsDict.ApplicationController = Ember.Controller.extend({
  fullName    : "#{gon.loggedUser.first_name} #{gon.loggedUser.last_name}"
  userAvatar  : gon.loggedUser.avatar
});
