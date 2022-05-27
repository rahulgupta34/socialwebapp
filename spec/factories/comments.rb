FactoryBot.define do
  factory :comment do
    body { "MyString" }
    commentor_email { "MyString" }
    post { nil }
    user { nil }
  end
end
