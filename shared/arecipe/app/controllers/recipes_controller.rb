class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:recipe_id] || params[:id])
  end
end