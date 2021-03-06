FactoryGirl.define do
  factory :restaurant do
    sequence :name do |n|
      "restaurant#{n}"
    end
    address { Faker::Address.city }

    # association :review
  end

  factory :invalid_restaurant, parent: :restaurant do
    name nil
    address nil
  end
end
