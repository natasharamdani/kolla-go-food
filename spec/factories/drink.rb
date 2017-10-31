FactoryGirl.define do
  factory :drink do
    name { Faker::Food.dish }
    description { Faker::Food.ingredient }
    price 10000.0
  end

  factory :invalid_drink, parent: :drink do
    name nil
    description nil
    price 10000.0
  end
end
