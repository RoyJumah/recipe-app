class RecipeFoodsController < ApplicationController
  def new
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = current_user.foods
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = current_user.foods
    @recipe_foods = RecipeFoods.create(recipe_params)
    @recipe_foods.recipe_id = @recipe.id
    @recipe_foods.food_id = @food.id
    if @recipe_food.save
      redirect_to recipe_path(@recipe)
    else
      render 'recipes/show'
    end
  end

  def recipe_params
    params.require(:recipe_foods).permit(:quantity)
  end
end
