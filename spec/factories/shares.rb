FactoryBot.define do
  factory :share do
    id {1}
    title {Faker::Name.initials(number: 2)}
    share_url {"https://qiita.com/"}
    comment {Faker::Name.initials(number: 2)}
    category_id {1}
    user_id {1}
    user
  end
end
