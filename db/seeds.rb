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

#sample end_user
EndUser.create!(
   email: 'user@admin.com',
   password: 'adminadmin',
   first_name: '太郎',
   last_name: 'サンプル',
   first_name_kana: 'タロウ',
   last_name_kana: 'サンプル',
   postal_code: '140-0000',
   address: '東京都品川区1-12-123',
   telephone_number: '012-3456-7890',
   is_deleted: false
)

#50 persons sample_data,
#japanese => config/locale/ja.yml

50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  first_name_kana = "タロウ"
  last_name_kana = "サンプル"
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
    is_deleted: is_deleted
  )

  Delivery.create!(
    end_user_id: end_user.id,
    name: end_user.last_name + end_user.first_name,
    postal_code: end_user.postal_code,
    address: end_user.address
  )

end


#is_invalid != 1  => true

Genre.create!(
  name: 'ケーキ',
  is_invalid:true
)

Genre.create!(
  name: 'プリン',
  is_invalid:true
)

Genre.create!(
  name: '焼き菓子',
  is_invalid:true
)

Genre.create!(
  name: 'キャンディ',
  is_invalid:true
)


#3 items
Item.create!(
  genre_id: 1,
  name: 'メロンシャンティ',
  price: 600,
  is_soldout:false,
  image:File.open("./app/assets/images/image01.jpg"),
  introduction: "よく完熟したメロンをくりぬいて、カスタードクリームと果肉、生クリームを詰め込んで作られたとてもぜいたくなケーキです"
)



Item.create!(
  genre_id: 1,
  name: 'ピカケーキ',
  price: 1500,
  is_soldout: false,
  image:File.open("./app/assets/images/image02.jpg"),
  introduction: "みんな大好き、かわいいピカチュウのケーキです"
)

Item.create!(
  genre_id: 2,
  name:'なめらか濃厚プリン',
  price:300,
  is_soldout: false,
  image:File.open("./app/assets/images/image05.jpg"),
  introduction: "濃厚な卵とミルクの甘み際立つ絶品の味わいです"
  )

Item.create!(
  genre_id: 3,
  name:'マカロン',
  price:300,
  is_soldout: false,
  image:File.open("./app/assets/images/image04.jpg"),
  introduction: "濃厚な卵とミルクの甘み際立つ絶品の味わいです"
  )


Item.create!(
  genre_id: 4,
  name:'ペロペロキャンディ',
  price:100,
  is_soldout: true,
  image:File.open("./app/assets/images/image06.jpg"),
  introduction: "カラフルで楽しい棒付きキャナディです。"
  )
