FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    password { Faker::Internet.password }
    password_confirmation password
  end

  factory :invalid_user, parent: :user do
    name nil
    password nil
    password_confirmation nil
  end
end
