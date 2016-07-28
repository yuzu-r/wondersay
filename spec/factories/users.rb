FactoryGirl.define do
  sequence :email do |n|
    "testEmail#{n}@example.com"
  end

  factory :user do
    email
    password "password"
    password_confirmation "password"
    approved "true"
  end

  factory :quote do
    quote "this is the quote"
    author "jack will"
  end
end
