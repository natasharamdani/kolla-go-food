# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.delete_all

Restaurant.create!(
  name: "Street Food",
  address: "Jl. Sabang"
)

Restaurant.create!(
  name: "Kedai Babeh",
  address: "Setu Babakan"
)

Restaurant.create!(
  name: "Roti Bakar",
  address: "Blok M"
)

Restaurant.create!(
  name: "Warung Tegal",
  address: "Kelapa Dua, Depok"
)

Restaurant.create!(
  name: "RM Padang",
  address: "Mampang Prapatan"
)

Food.delete_all

Food.create!(
  name: "Dimsum",
  description: "Isi ayam, udang, dan jamur.",
  image_url: "Dimsum.jpg",
  price: 30000.00,
  category_id: 1,
  restaurant_id: 1
)

Food.create!(
  name: "Siomay",
  description: "Sudah termasuk tahu dan telur rebus.",
  image_url: "Siomay.jpg",
  price: 15000.00,
  restaurant_id: 1
)

Food.create!(
  name: "Batagor",
  description: "Nikmat dan tanpa bahan pengawet.",
  image_url: "Batagor.jpg",
  price: 10000.00,
  restaurant_id: 1
)

Food.create!(
  name: "Bir Pletok",
  description: "Traditional Beer from Jakarta.",
  image_url: nil,
  price: 12500.00,
  category_id: 2,
  restaurant_id: 2
)

Food.create!(
  name: "Roti Buaya",
  description: "Betawi bread in the shape of crocodile.",
  image_url: nil,
  price: 7500.00,
  category_id: 2,
  restaurant_id: 2
)

Food.create!(
  name: "Roti Bakar Coklat",
  description: ".",
  image_url: nil,
  price: 15000,
  restaurant_id: 3
)

Food.create!(
  name: "Roti Bakar Keju",
  description: ".",
  image_url: nil,
  price: 20000,
  restaurant_id: 3
)

Food.create!(
  name: "Soto Ayam",
  description: ".",
  image_url: nil,
  price: 15000,
  restaurant_id: 4
)

Food.create!(
  name: "Rawon",
  description: ".",
  image_url: nil,
  price: 20000,
  restaurant_id: 4
)

Food.create!(
  name: "Rendang",
  description: ".",
  image_url: nil,
  price: 15000,
  restaurant_id: 5
)

Food.create!(
  name: "Ayam Pop",
  description: ".",
  image_url: nil,
  price: 12000,
  restaurant_id: 5
)

LineItem.delete_all

LineItem.create!(
  food_id: 1,
  cart_id: nil,
  quantity: 1,
  order_id: 1
)

LineItem.create!(
  food_id: 2,
  cart_id: nil,
  quantity: 2,
  order_id: 2
)

LineItem.create!(
  food_id: 3,
  cart_id: nil,
  quantity: 1,
  order_id: 2
)

LineItem.create!(
  food_id: 4,
  cart_id: nil,
  quantity: 1,
  order_id: 3
)

LineItem.create!(
  food_id: 5,
  cart_id: nil,
  quantity: 1,
  order_id: 3
)

LineItem.create!(
  food_id: 6,
  cart_id: nil,
  quantity: 4,
  order_id: 4
)

LineItem.create!(
  food_id: 7,
  cart_id: nil,
  quantity: 3,
  order_id: 5
)

LineItem.create!(
  food_id: 8,
  cart_id: nil,
  quantity: 1,
  order_id: 6
)

LineItem.create!(
  food_id: 9,
  cart_id: nil,
  quantity: 1,
  order_id: 7
)

LineItem.create!(
  food_id: 10,
  cart_id: nil,
  quantity: 1,
  order_id: 8
)

LineItem.create!(
  food_id: 11,
  cart_id: nil,
  quantity: 1,
  order_id: 8
)

LineItem.create!(
  food_id: 1,
  cart_id: nil,
  quantity: 1,
  order_id: 9
)

LineItem.create!(
  food_id: 2,
  cart_id: nil,
  quantity: 1,
  order_id: 9
)

LineItem.create!(
  food_id: 3,
  cart_id: nil,
  quantity: 1,
  order_id: 10
)

Order.delete_all

Order.create!(
  name: "Nanda",
  address: "Depok",
  email: "nanda@mail.com",
  payment_type: 0,
  created_at: "2017-11-01 09:00:00",
  updated_at: "2017-11-01 09:00:00",
  voucher_id: nil,
  total_price: 30000
)

Order.create!(
  name: "Ajeng",
  address: "Bogor",
  email: "ajeng@mail.com",
  payment_type: 1,
  created_at: "2017-11-01 12:00:00",
  updated_at: "2017-11-01 12:00:00",
  voucher_id: nil,
  total_price: 40000
)

Order.create!(
  name: "Umar",
  address: "Cengkareng",
  email: "umar@mail.com",
  payment_type: 2,
  created_at: "2017-11-01 17:00:00",
  updated_at: "2017-11-01 17:00:00",
  voucher_id: nil,
  total_price: 20000
)

Order.create!(
  name: "Nur",
  address: "Jl. Sabang",
  email: "nur@mail.com",
  payment_type: 0,
  created_at: "2017-11-02 07:00:00",
  updated_at: "2017-11-02 07:00:00",
  voucher_id: nil,
  total_price: 60000
)

Order.create!(
  name: "Qurin",
  address: "Jl. Sabang",
  email: "qurin@mail.com",
  payment_type: 1,
  created_at: "2017-11-02 15:00:00",
  updated_at: "2017-11-02 15:00:00",
  voucher_id: nil,
  total_price: 60000
)

Order.create!(
  name: "Aris",
  address: "Karawaci",
  email: "aris@mail.com",
  payment_type: 2,
  created_at: "2017-11-02 21:00:00",
  updated_at: "2017-11-02 21:00:00",
  voucher_id: nil,
  total_price: 15000
)

Order.create!(
  name: "Tira",
  address: "Karawaci",
  email: "tira@mail.com",
  payment_type: 2,
  created_at: "2017-11-03 08:00:00",
  updated_at: "2017-11-03 08:00:00",
  voucher_id: nil,
  total_price: 20000
)

Order.create!(
  name: "Nanda",
  address: "Depok",
  email: "nanda@mail.com",
  payment_type: 2,
  created_at: "2017-11-03 16:00:00",
  updated_at: "2017-11-03 16:00:00",
  voucher_id: nil,
  total_price: 27000
)

Order.create!(
  name: "Ajeng",
  address: "Bogor",
  email: "ajeng@mail.com",
  payment_type: 0,
  created_at: "2017-11-04 10:00:00",
  updated_at: "2017-11-04 10:00:00",
  voucher_id: nil,
  total_price: 45000
)

Order.create!(
  name: "Umar",
  address: "Cengkareng",
  email: "umar@mail.com",
  payment_type: 1,
  created_at: "2017-11-04 14:00:00",
  updated_at: "2017-11-04 14:00:00",
  voucher_id: nil,
  total_price: 10000
)

User.delete_all

User.create!(
  username: "admin",
  password: "adminadmin"
)

User.create!(
  username: "nanda",
  password: "nandananda"
)

Role.delete_all

Role.create!(
  name: "administrator"
)

Role.create!(
  name: "customer"
)

# User_Role.delete_all

# User_Role.create!(
#   user_id: 1,
#   role_id: 1
# )

# User_Role.create!(
#   user_id: 2,
#   role_id: 2
# )

Category.delete_all

Category.create!(
  name: "Chinese Food"
)

Category.create!(
  name: "Khas Betawi"
)

Voucher.delete_all

Voucher.create!(
  code: "DISKON",
  valid_from: "2017-11-01",
  valid_through: "2017-11-30",
  amount: 25,
  unit: "percent",
  max_amount: 20000
)

Voucher.create!(
  code: "HEMAT",
  valid_from: "2017-11-01",
  valid_through: "2017-11-30",
  amount: 20000,
  unit: "rupiah",
  max_amount: 20000
)

# Buyer.delete_all

# Buyer.create!(
#   email: "nanda@gmail.com",
#   name: "Nanda",
#   phone: "021",
#   address: "Depok"
# )

# Buyer.create!(
#   email: "ajeng@ymail.com",
#   name: "Ajeng",
#   phone: "081",
#   address: "Bogor"
# )

# Tag.delete_all

# Tag.create!(
#   name: "Chinese Food"
# )

# Tag.create!(
#   name: "Khas Betawi"
# )
