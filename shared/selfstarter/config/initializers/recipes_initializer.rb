if Recipe.count != 100
  Recipe.destroy_all
  Ingredient.destroy_all

  ingredients = %w{Meat Noodles Tomatoes Zucchini Letuce Avocado Brocoli Beans Rice Couscous Cheese Fish Milk}

  ingredients.each do |ingredient|
    Ingredient.create!(:name => ingredient, :weight => rand(900))
  end

  100.times do
    recipe_ingredients = []
    rand(ingredients.length).times {recipe_ingredients << ingredients.shuffle.first}
    name = "Recipe: #{Recipe.count}"
    recipe = Recipe.create!(:name => name)
    recipe_ingredients.each do |recipe_ingredient|
      ingredient = Ingredient.where(:name => recipe_ingredient).first
      RecipeIngredient.create!(:recipe_id => recipe.id, :ingredient_id => ingredient.id, :amount => rand(20))
    end
  end
end