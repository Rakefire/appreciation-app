FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    verified_at { Time.now }

    trait :needing_verification do
      verification_token "abcd"
      verified_at nil
    end
  end

  factory :appreciation do
    name { Faker::Name.name }
    quality { Faker::Cannabis.buzzword }
    note { Faker::FamousLastWords.last_words }
    user
  end
end
