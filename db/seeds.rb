# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

date='2021-11-01'

Admin.create!(
  email: 'admin@admin.com',
  password: 'naganocake'
  )

Customer.create!(
  last_name: "令和",
  first_name: "道子",
  last_name_kana: "レイワ",
  first_name_kana: "ミチコ",
  post_code: "0000000",
  address: "東京都渋谷区代々木神園町0-0",
  phone_number: "12345678910",
  email: "sample@example.com",
  password: "naganocake",
  is_quited: false,
  created_at: date,
  updated_at: date
  )

Genre.create(
  [{
      name: "ケーキ",
      created_at: date,
      updated_at: date
    },
    {
      name: "プリン",
      created_at: date,
      updated_at: date
    },
    {
      name: "焼き菓子",
      created_at: date,
      updated_at: date
    },
    {
      name: "キャンディ",
      created_at: date,
      updated_at: date
    }]
  )

Item.create(
  [{
    genre_id: 1,
    name: "アップルケーキ",
    description: "アンデルセンファームで採れた紅玉りんごを使用したケーキです。",
    price: 2000,
    image: File.open('./app/assets/images/apple-cake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
  },
  {
    genre_id: 1,
    name: "チョコレートケーキ",
    description: "見た目も華やかな濃厚チョコレートケーキです。",
    price: 2500,
    image: File.open('./app/assets/images/Chocolate-Dulce-de-Leche-Cake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
  },
  {
    genre_id: 1,
    name: "ノンエッグケーキ",
    description: "このケーキは今まで普通のケーキを食べられなかったお子様にも安心してお召し上がり頂けるように卵を使っていない美味しいスポンジケーキです。",
    price: 2000,
    image: File.open('./app/assets/images/Eggnog-Cake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
  },
  {
    genre_id: 1,
    name: "フルーツマカロン",
    description: "卵や牛乳を全く使用していませんが、豆乳バターや低糖度のジャムをふんだんに使用しているため、濃厚な味わいをお楽しみいただけます。",
    price: 2000,
    image: File.open('./app/assets/images/macaroons.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
  },
  {
    genre_id: 1,
    name: "ベイクドケーキ",
    description: "デンマーク産クリームチーズをたっぷり使用した、濃厚な味が自慢のタルトタイプのベイクドチーズケーキです。",
    price: 3000,
    image: File.open('./app/assets/images/baked-cake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    },
    {
    genre_id: 3,
    name: "ビターチョコクッキー",
    description: "ビターなカカオマスをそのまま使用し、チョコレート好きの方に喜んで頂けるチョコレートを味わうクッキーに仕上げました。",
    price: 1000,
    image: File.open('./app/assets/images/cookie.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    },
    {
    genre_id: 1,
    name: "チョコレートテリーヌ",
    description: "濃厚でなめらかな口どけのチョコレートテリーヌです。",
    price: 3000,
    image: File.open('./app/assets/images/chocolatecake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    },
    {
    genre_id: 1,
    name: "カップケーキ",
    description: "つやつや光るシロップ漬けやセミドライの果実がごろごろ入った、しっとりとしたカップケーキです。",
    price: 1000,
    image: File.open('./app/assets/images/cupcake_14.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    },
    {
    genre_id: 1,
    name: "ストロベリーケーキ",
    description: "ピンクのグラデーションとローズ絞り、イチゴをトッピングしてラブリーに仕上げました。",
    price: 8000,
    image: File.open('./app/assets/images/strawberry-cake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    },
    {
    genre_id: 1,
    name: "サンタケーキ",
    description: "こだわり卵と北海道産バターを使用して作った ふんわり柔らかなスポンジにアクセントに砕いたクッキーをサンドしチョコレートでグラサージュしました。",
    price: 2500,
    image: File.open('./app/assets/images/santacake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    },
    {
    genre_id: 1,
    name: "リコッタケーキ",
    description: "自家製のレモンジャムとリコッタチーズを隠し味に加え 甘みを極力抑えたチーズケーキです。",
    price: 1000,
    image: File.open('./app/assets/images/Olive-Oil-Ricotta-Cake.jpeg'),
    is_active: true,
    created_at: date,
    updated_at: date
    }
    ]
  )

Order.create!(
   shipping_fee: '800',
)
