class Recipe < ActiveRecord::Base
  attr_accessible :image, :name, :user_id

  belongs_to :user

  has_many :recipe_ingredients, :dependent => :destroy
  has_many :ingredients, :through => :recipe_ingredients
  has_many :preparation_steps, :dependent => :destroy
  has_many :likes


  scope :cheapest, :order => 'SUM(recipe_ingredients.amount * ingredients.price) ASC', :joins => {:recipe_ingredients => :ingredient}, :group => 'recipes.id'
  scope :most_expensive, :order => 'SUM(recipe_ingredients.amount * ingredients.price) DESC', :joins => {:recipe_ingredients => :ingredient}, :group => 'recipes.id'

  scope :quickest, :order => 'SUM(preparation_steps.duration) ASC', :joins => :preparation_steps, :group => 'recipes.id'
  scope :slowest, :order => 'SUM(preparation_steps.duration) DESC', :joins => :preparation_steps, :group => 'recipes.id'

  scope :most_liked, :order => 'COUNT(likes.id) DESC', :joins => :likes, :group => 'recipes.id'

  def self.random
    first(:offset => rand(count))
  end

  def price
    recipe_ingredients.sum {|ri| ri.amount * ri.ingredient.price}
  end

  def duration
    preparation_steps.sum(&:duration)
  end
end