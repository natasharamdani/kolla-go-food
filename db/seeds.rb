# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.delete_all

Food.create!(
  name: "Dimsum",
  description: "Isi ayam, udang, dan jamur.",
  image_url: "Dimsum.jpg",
  price: 30000.00
)

Food.create!(
  name: "Siomay",
  description: "Sudah termasuk tahu dan telur rebus.",
  image_url: "Siomay.jpg",
  price: 20000.00,
  category_id: 1
)

Food.create!(
  name: "Batagor",
  description: "Nikmat dan tanpa bahan pengawet.",
  image_url: "Batagor.jpg",
  price: 15000.00
)

Food.create!(
  name: "Bir Pletok",
  description: "Traditional Beer from Jakarta.",
  image_url: nil,
  price: 25000.00,
  category_id: 2
)

Food.create!(
  name: "Roti Buaya",
  description: "Betawi bread in the shape of crocodile.",
  image_url: nil,
  price: 5000.00,
  category_id: 1
)

# Buyer.delete_all

# Buyer.create!(
#   email: "nanda@gmail.com",
#   name: "nanda",
#   phone: "021",
#   address: "depok"
# )

# Buyer.create!(
#   email: "ajeng@ymail.com",
#   name: "ajeng",
#   phone: "123",
#   address: "bogor"
# )

Category.delete_all

Category.create!(
  name: "Tradisional"
)

Category.create!(
  name: "Khas Betawi"
)

User.delete_all

User.create!(
  username: "nanda",
  password: "12345678"
)

Voucher.delete_all

Voucher.create!(
  code: "DISKON",
  valid_from: "2017-11-01",
  valid_through: "2017-11-30",
  amount: 25,
  unit: "percent",
  max_amount: 10000
)

Voucher.create!(
  code: "HEMAT",
  valid_from: "2017-11-01",
  valid_through: "2017-11-30",
  amount: 10000,
  unit: "rupiah",
  max_amount: 10000
)
