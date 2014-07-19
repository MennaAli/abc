# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  name "MennaAli"
  email "menna@spec.com"
  password "12345678900"
  password_confirmation "12345678900"
  end
end
