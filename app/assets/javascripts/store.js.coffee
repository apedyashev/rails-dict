#Rails pluralizes dict_entry correctly, but Ember - not. So specify correct plural version
#DS.RESTAdapter.configure "plurals",
#  dict_entry: "dict_entries"



#RailsDict.Store = DS.Store.extend
#  adapter: DS.RESTAdapter.create()

# how to extract metadata from json: http://stackoverflow.com/a/18250428/2248909
RailsDict.serializer = DS.RESTSerializer.create({ total: 'total' });

RailsDict.CustomAdapter = DS.RESTAdapter.extend({
  serializer: RailsDict.serializer
});

RailsDict.Store = DS.Store.extend({
  adapter: 'RailsDict.CustomAdapter'
});




