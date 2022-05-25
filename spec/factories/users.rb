FactoryBot.define do
  factory :user do
    email {"rahul@bac.com"}
    password {"admin@123"}
    password_confirmation {"admin@123"}
    image { "rahul.jpg" }
  end
end
