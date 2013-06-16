class Ingredient < ActiveRecord::Base
  attr_accessible :name, :price, :unit

  has_many :recipe_ingredients, :dependent => :destroy
  has_many :recipes, :through => :recipe_ingredients

  validates :name, :uniqueness => true, :presence => true, :length => {:minimum => 2}
  validates :price, :presence => true
  validates :unit, :presence => true, :length => {:minimum => 1}
end
