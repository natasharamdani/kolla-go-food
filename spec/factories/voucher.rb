FactoryGirl.define do
  factory :voucher do
    code { Faker::Lorem.word.upcase }
    valid_from { Faker::Date.backward(30) }
    valid_through { Faker::Date.forward(30) }
    amount { Faker::Number.between(1, 100) }
    unit "Percent"
    max_amount { Faker::Number.between(101, 1000) }
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
