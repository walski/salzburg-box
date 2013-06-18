# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:random_recipe) {|n| Recipe.first(:offset => rand(Recipe.count))}

  factory :like do
    recipe {generate(:random_recipe)}
    user {generate(:random_user)}
  end
end
