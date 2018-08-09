FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    verified_at { Time.now }

    trait :needing_verification do
      verification_token "abcd"
      verified_at nil
    end
  end
end
