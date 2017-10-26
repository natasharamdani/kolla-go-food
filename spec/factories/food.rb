FactoryGirl.define do
  factory :food do
    name { Faker::Food.dish }
    description { Faker::Food.ingredient }
    price 10000.0
    image_url "image.jpg"
  end

  factory :invalid_food, parent: :food do
    name nil
    description nil
    price 10000.0
    image_url "image.jpeg"
  end
end
