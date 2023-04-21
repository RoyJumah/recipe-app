class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, :recipe_foods).where(public: true)
  end
end
