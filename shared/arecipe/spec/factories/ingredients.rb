# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:price) {|n| x=rand * 60; Math::E ** (x / 16) - 0.5 }
  sequence(:unit) {|n| FAKE_COOKING[:units].shuffle.first}
  sequence(:ingredient_name) {|n| FAKE_COOKING[:ingredients][n - 1]}

  factory :ingredient do
    price {generate(:price)}
    unit {generate(:unit)}
    name {generate(:ingredient_name)}
  end
end
