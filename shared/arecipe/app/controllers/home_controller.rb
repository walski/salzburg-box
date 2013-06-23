class HomeController < ApplicationController

  caches_action :index, :layout => false, :expires_in => 30

  def index
    @hot_recipes   = 3.times.map {Recipe.random}

    @cheap_recipes = Recipe.cheapest.limit(200).shuffle[-5..-1]
    @quick_recipes = Recipe.quickest.limit(200).shuffle[-5..-1]
    @loved_recipes = Recipe.most_liked.limit(5)

    if current_user
      @loved_recipes_from_me = current_user.recipes.most_liked.limit(3)
    end
  end
end