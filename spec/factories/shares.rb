FactoryBot.define do
  factory :share do
    title {Faker::Name.initials(number: 2)}
    share_url {"https://qiita.com/"}
    comment {Faker::Name.initials(number: 2)}
    category_id {1}
    association :user
  end
end
