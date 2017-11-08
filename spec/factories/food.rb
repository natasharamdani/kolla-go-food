FactoryGirl.define do
  factory :food do
    name { Faker::Food.dish }
    description { Faker::Food.ingredient }
    price 10000.0
    association :category
    tag_ids {[]}
    association :restaurant
    association :review
  end

  factory :invalid_food, parent: :food do
    name nil
    description nil
  end
end
