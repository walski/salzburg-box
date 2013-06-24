class AddIndicesToExistingTables < ActiveRecord::Migration
  def change
    add_index( :likes, :recipe_id)
    add_index(:preparation_steps, :recipe_id)
    add_index(:preparation_steps, :duration)
    add_index(:recipe_ingredients, :recipe_id)
    add_index(:recipe_ingredients, :amount)
    add_index(:ingredients, :price)
  end
end
