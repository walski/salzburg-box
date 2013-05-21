class CreateDummies < ActiveRecord::Migration
  def change
    create_table :dummies do |t|
      t.string :data
      t.integer :number

      t.timestamps
    end
  end
end
