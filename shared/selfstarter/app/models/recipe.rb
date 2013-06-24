class Recipe < ActiveRecord::Base
  attr_accessible :name

  has_many :recipe_ingredients, :dependent => :destroy

  def weight
    Rails.cache.fetch("recipie-weight-#{self.id}") do
      weight = 0
      recipe_ingredients.each do |recipe_ingredient|
        weight += recipe_ingredient.amount * recipe_ingredient.ingredient.weight
      end
      weight
    end
  end
end
