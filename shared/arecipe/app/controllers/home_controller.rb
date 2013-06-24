class HomeController < ApplicationController
  def index
    @hot_recipes   = Rails.cache.fetch("home/hot_recipes", :expires_in=>1.hour) do
      3.times.map {Recipe.random}
    end

    @cheap_recipes = Rails.cache.fetch("home/cheap_recipes", :expires_in=>1.hour) do
      Recipe.cheapest.limit(200).shuffle[-5..-1]
    end
    @quick_recipes = Rails.cache.fetch("home/quick_recipes", :expires_in=>1.hour) do
      Recipe.quickest.limit(200).shuffle[-5..-1]
    end
    @loved_recipes = Rails.cache.fetch("home/loved_recipes", :expires_in=>1.hour) do
      Recipe.most_liked.limit(5)
    end

    if current_user
      @loved_recipes_from_me = current_user.recipes.most_liked.limit(3)
    end
  end
end