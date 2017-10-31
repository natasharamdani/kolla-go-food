FactoryGirl.define do
  factory :food do
    name { Faker::Food.dish }
    description { Faker::Food.ingredient }
    price 10000.0
  end

  factory :invalid_food, parent: :food do
    name nil
    description nil
  end

  factory :food_category, parent: :food do
    association :category
  end
end
