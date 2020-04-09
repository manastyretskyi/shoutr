FactoryBot.define do
  factory :text_shout do
    body { Faker::Lorem.sentence }
  end

  factory :shout do
    user { create(:user) }
    content { create(:text_shout) }
  end
end
