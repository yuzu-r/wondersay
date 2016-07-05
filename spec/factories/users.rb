FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "testEmail#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
  end

  factory :quote do
    quote "this is the quote"
    author "jack will"
  end
end
