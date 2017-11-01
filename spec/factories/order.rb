FactoryGirl.define do
  factory :order do
    name { Faker::Superhero.name }
    address { Faker::Address.city }
    email { Faker::Internet.email }
    payment_type { Faker::Number.between(0, 2) }
  end

  factory :invalid_order, parent: :order do
    name nil
    address nil
    email nil
    payment_type nil
  end
end
