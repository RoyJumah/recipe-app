class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @recipes_food = @recipes.recipes_food.includes(:user, recipe_foods: [:food]).order(created_at: :desc)
  end
end
