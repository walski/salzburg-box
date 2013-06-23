class RecipesController < ApplicationController

  caches_action :show, :layout => false, :expires_in => 30

  def show
    @recipe = Recipe.find(params[:recipe_id] || params[:id])
  end
end