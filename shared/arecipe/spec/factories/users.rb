# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:user_name) {|n| Faker::Name.name}
  sequence(:email) {|n| Faker::Internet.email}

  factory :user do
    name {generate(:user_name)}
    email {generate(:email)}
    password 'testtest'
    password_confirmation 'testtest'
  end
end
