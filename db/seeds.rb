# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  [
    {name: 'ちゆ', birthday: '1999-02-14'},
    {name: 'ちゆ', birthday: '2003-02-14'},
    {name: 'もなみ', birthday: '2002-02-09'},
    {name: 'もなみ', birthday: '2006-02-09'},
    {name: 'メモリ', birthday: '2003-11-02'},
    {name: 'メモリ', birthday: '2004-11-02'},
  ]
)
