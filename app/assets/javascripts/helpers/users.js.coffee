Ember.Handlebars.helper 'renderStatusIsConnectedWithMe', (user, options)->
  pos = $.inArray gon.loggedUser.id, user.get('connected_user_ids')
  if pos isnt -1
    new Handlebars.SafeString('<span class="highlight">Yes</span>')

