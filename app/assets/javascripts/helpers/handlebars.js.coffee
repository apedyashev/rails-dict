Ember.Handlebars.helper 'if_in_array', (val, arr, opts)->
  if $.inArray(parseInt(val), arr) isnt (-1)
    return opts.fn(this);
  else
    return opts.inverse(this);