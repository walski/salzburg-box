class RecipesController < ApplicationController


  caches_action :show, :expires_in => 10.minutes
  def show
    @recipe = Recipe.find(params[:recipe_id] || params[:id])
  end
end