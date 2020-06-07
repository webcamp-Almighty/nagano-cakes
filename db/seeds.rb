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
EndUser.create!(
   email: 'user@admin.com',
   password: 'adminadmin'
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


Order.create!(
	end_user_id: 1,
	name: 'hogeo1',
	postal_code: 1234567,
	address: '東京都１番地',
	shipping_fees: 800,
	payment_method: "bank_transfer",
	total_price: 1800,
	order_status: 1,
)

Order.create!(
	end_user_id: 1,
	name: 'hogeo2',
	postal_code: 2345678,
	address: '東京都２番地',
	shipping_fees: 800,
	payment_method: 'credit_card' ,
	total_price: 1500,
	order_status: 0,
)

Order.create!(
	end_user_id: 1,
	name: 'hogeo3',
	postal_code: 3456789,
	address: '東京都３番地',
	shipping_fees: 800,
	payment_method: 'credit_card' ,
	total_price: 500,
	order_status: 3,
)
