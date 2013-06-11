# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:random_user) {|n| User.first(:offset => rand(User.count))}
  sequence(:image) {|n| rand(105)}
  sequence(:recipe_name) {|n| FAKE_COOKING[:recipes][n]}

  factory :recipe do
    name {generate(:recipe_name)}
    image {generate(:image)}
    user {generate(:random_user)}

    ignore do
      step_count {rand(25)}
      ingredients_count {rand(15)}
    end

    after(:create) do |recipe, evaluator|
      FactoryGirl.create_list(:preparation_step, evaluator.step_count, recipe: recipe)

      all_ingredients_count = Ingredient.count
      evaluator.ingredients_count.times do
        ingredient = Ingredient.first(:offset => rand(all_ingredients_count))
        amount = rand(100)
        RecipeIngredient.create(:recipe_id => recipe.id, :ingredient_id => ingredient.id, :amount => amount)
      end
    end
  end
end