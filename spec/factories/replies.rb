FactoryBot.define do
  factory :reply do
    body { "MyString" }
    comment { nil }
    user { nil }
    post { nil }
  end
end
