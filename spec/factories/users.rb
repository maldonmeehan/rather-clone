FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password("test_password")
  end
end
