class CreatePreparationSteps < ActiveRecord::Migration
  def change
    create_table :preparation_steps do |t|
      t.integer :recipe_id
      t.text :instructions
      t.integer :duration

      t.timestamps
    end
  end
end
