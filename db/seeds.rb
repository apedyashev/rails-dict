# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DictEntry.delete_all

DictEntry.create([{
      phrase: 'word1',
      translation: 'translation1'
    }, {
      phrase: 'word2',
      translation: 'translation2'
    }, {
      phrase: 'word3',
      translation: 'translation3'
    }
])