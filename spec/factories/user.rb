FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password "{ Faker::Internet.password }"
    password_confirmation "{ Faker::Internet.password }"
  end

  factory :invalid_user, parent: :user do
    username nil
    password nil
    password_confirmation nil
  end
end
