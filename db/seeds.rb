# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin.com',
   password: 'adminadmin',
)

Genre.create!(
	name: 'ケーキ',
	is_invalid:1
)

Genre.create!(
	name: 'プリン',
	is_invalid:1
)

Genre.create!(
	name: '焼き菓子',
	is_invalid:1
)

Genre.create!(
	name: 'キャンディ',
	is_invalid:1
)
