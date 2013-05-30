#Rails pluralizes dict_entry correctly, but Ember - not. So specify correct plural version
DS.RESTAdapter.configure "plurals",
  dict_entry: "dict_entries"


RailsDict.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter.create()



