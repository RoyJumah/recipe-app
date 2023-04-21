class ShoppingListController < ApplicationController
  def index
    @food = []
    if params[:button_clicked]
      @food = current_user.foods.left_outer_joins(:recipe_foods).where(recipe_foods: { id: nil })
      @foodcounts = @food.count
      @foodprices = @food.sum(:price)
      flash[:success] = 'Shopping list updated successfully.'
      # session[:shopping_list] = { food: @food, foodcounts: @foodcounts, foodprices: @foodprices }
    elsif @food.present?
      @foodcounts = @food.count
      @foodprices = @food.sum(:price)
      flash[:success] = 'Shopping list updated successfully.'
    else
      flash[:alert] = 'Shopping list not updated.'
      @food = []
      @foodcounts = 0
      @foodprices = 0
    end
  end
end
