FactoryGirl.define do
  factory :answer do
    content Faker::Hipster.sentence(3, false, 4)
  end
end
