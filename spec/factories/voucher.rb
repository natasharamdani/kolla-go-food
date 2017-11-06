FactoryGirl.define do
  factory :voucher do
    code { Faker::Lorem.word.upcase }
    valid_from { Faker::Date.backward(30) }
    valid_through { Faker::Date.forward(30) }
    amount { Faker::Number.between(1, 100) }
    unit "percent"
    max_amount { Faker::Commerce.price }
  end

  factory :invalid_voucher, parent: :voucher do
    code nil
    valid_from nil
    valid_through nil
    amount nil
    unit nil
    max_amount nil
  end
end
