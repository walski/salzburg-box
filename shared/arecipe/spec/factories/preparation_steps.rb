# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:duration) {rand(180)}
  sequence(:instruction) {|n| FAKE_COOKING[:instructions][n]}

  factory :preparation_step do
    instructions {generate(:instruction)}
    duration {generate(:duration)}
  end
end
