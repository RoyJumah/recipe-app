class RecipeFoodsController < ApplicationController
  def new
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @foods = current_user.foods
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @foods = current_user.foods
    @food = Food.find(params[:recipe_food][:food_id])
    @recipe_food = @recipe.recipe_foods.find_by(food_id: @food.id)
    if @recipe_food
      @recipe_food.update(quantity: params[:recipe_food][:quantity])
    else
      @recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: params[:recipe_food][:quantity])
      @recipe_food.save
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully deleted.'
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
