FactoryBot.define do
  factory :address do
    address { "MyString" }
    pincode { "MyString" }
    state { "MyString" }
    country { "MyString" }
    landmark { "MyString" }
    user { nil }
  end
end
