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
  description:
    %{<p>
      <em>3 rasa dalam 1 porsi</em>
      Dimsum isi ayam, udang, dan jamur.
      Ayo coba!
      </p>},
  image_url: "Dimsum.jpg",
  price: 30000.00
)

Food.create!(
  name: "Siomay",
  description: "Sudah termasuk tahu dan telur rebus.",
  image_url: "Siomay.jpg",
  price: 20000.00
)

Food.create!(
  name: "Batagor",
  description: "Nikmat dan tanpa bahan pengawet.",
  image_url: "Batagor.jpg",
  price: 15000.00
)

Buyer.delete_all

Buyer.create!(
  email: "nanda@gmail.com",
  name: "nanda",
  phone: "021",
  address: "depok"
)

Buyer.create!(
  email: "ajeng@ymail.com",
  name: "ajeng",
  phone: "123",
  address: "bogor"
)
Buyer.create!(
  email: "umar@live.com",
  name: "umar",
  phone: "081",
  address: "jakarta"
)
