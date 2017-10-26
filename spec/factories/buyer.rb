FactoryGirl.define do
  factory :buyer do
    email { Faker::Internet.email }
    name { Faker::Superhero.name }
    phone { Faker::PhoneNumber.subscriber_number(12) }
    address { Faker::Address.city }
  end

  factory :invalid_buyer, parent: :buyer do
    email nil
    name nil
    phone nil
    address nil
  end
end
