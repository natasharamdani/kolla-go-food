FactoryGirl.define do
  factory :review do
    reviewer { Faker::Superhero.name }
    title "title"
    description "description"
  end

  factory :invalid_review, parent: :review do
    reviewer nil
    title nil
    description nil
  end
end
