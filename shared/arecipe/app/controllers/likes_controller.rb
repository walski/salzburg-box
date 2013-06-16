class LikesController < ApplicationController
  before_filter :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.likes.create(:recipe_id => recipe.id)

    flash[:notice] = "Ok, you love #{recipe.name}!"

    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    Like.where(:user_id => current_user, :recipe_id => recipe.id).destroy_all

    flash[:notice] = "Sad, you don't like #{recipe.name} anymore"

    redirect_to recipe
  end
end