FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :admin do
      role { 2 }
    end
  end
end
