# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin.com',
   password: 'password',
)

EndUser.create!(
   email: 'test@test.com',
   password: 'password'
   first_name: 'サンプル',
   last_name: '太郎',
   first_name_kana: 'サンプル',
   last_name_kana: 'タロウ',
   postal_code: '140-0000',
   address: '東京都品川区1-12-123',
   telephone_number: '012-3456-7890',
   email: 'test@test.com',
   password: 'password',
   encrypted_password: 'password',
   is_deleted: false
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

#50persons sample_data

50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  first_name_kana = "サンプル"
  last_name_kana = "タロウ"
  postal_code = Faker::Address.postcode
  address = Faker::Address.state + Faker::Address.city
  telephone_number = Faker::PhoneNumber.cell_phone
  email = "example#{n}@gmail.com"
  is_deleted = Faker::Boolean.boolean


  end_user = EndUser.create!(
    first_name: first_name,
    last_name: last_name,
    first_name_kana: first_name_kana,
    last_name_kana: last_name_kana,
    postal_code: postal_code,
    address: address,
    telephone_number: telephone_number,
    email: email,
    password: 'password',
    encrypted_password: 'password',
    is_deleted: is_deleted
  )

  Delivery.create!(
    end_user_id: end_user.id,
    name: end_user.last_name + end_user.first_name,
    postal_code: end_user.postal_code,
    address: end_user.address
  )

end

