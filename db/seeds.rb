# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "a@a",
  password: "aaaaaa"
  )
Customer.create!(
  [
    {
      first_name: "難波",
      last_name: "専太",
      first_name_kana: "ナンバ",
      last_name_kana: "センタ",
      email: "0@0",
      postal_code: "5420076",
      address: "大阪府大阪市中央区難波4-4-4 難波御堂筋センタービル 8階",
      telephone_number: "00088889999",
      is_active: true,
      password: "000000",
    },
    {
      first_name: "六本木",
      last_name: "一",
      first_name_kana: "ロッポンギ",
      last_name_kana: "ハジメ",
      email: "1@1",
      postal_code: "1066223",
      address: "東京都港区六本木3-2-1 住友不動産六本木グランドタワー 23F",
      telephone_number: "09177772222",
      is_active: false,
      password: "111111",
    }
  ]
  )
Address.create!(
  [
    {
      customer_id: 1,
      name: "渋谷校",
      postal_code: "1500041",
      destination: "東京都渋谷区神南1-19-11 パークウェースクエア2 4階"
    },
    {
      customer_id: 1,
      name: "新宿校",
      postal_code: "1600022",
      destination: "東京都新宿区新宿2-5-10 成信ビル 4階"
    },
    {
      customer_id: 1,
      name: "難波校",
      postal_code: "5420076",
      destination: "大阪府大阪市中央区難波4-7-14 難波フロントビル 4階"
    }
  ]
  )
Genre.create!(
  [
    {
      name: "ケーキ",
      is_active: true,
    },
    {
      name: "焼き菓子",
      is_active: true,
    },
    {
      name: "プリン",
      is_active: false,
    },
    {
      name: "和菓子",
      is_active: false,
    },
    {
      name: "アイス",
      is_active: true,
    }
  ]
  )
for i in 1..10 do
  Item.create!(
    [
      {
        genre_id: 1,
        name: "ケーキ#{i}",
        introduction: "#{3*i-2}番目の商品です。",
        price: rand(1..10) * 100,
        image: File.open("./app/assets/images/cake#{i%5+1}.jpg"),
        is_active: true
      },
      {
        genre_id: 2,
        name: "クッキー#{i}",
        introduction: "#{3*i-1}番目の商品です。",
        price: rand(1..10) * 200,
        image: File.open("./app/assets/images/cookies#{i%5+1}.jpg"),
        is_active: true
      },
      {
        genre_id: 3,
        name: "プリン#{i}",
        introduction: "#{3*i}番目の商品です。",
        price: rand(1..10) * 300,
        image: File.open("./app/assets/images/pudding#{i%5+1}.jpg"),
        is_active: false
      }
    ]
    )
end