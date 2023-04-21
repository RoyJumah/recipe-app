# class ShoppingListController < ApplicationController
  # def index
    # if params[:button_clicked]
      # @food = current_user.foods.left_outer_joins(:recipe_foods).where(recipe_foods: { id: nil }).includes(:recipe_foods)
      # @foodcounts = @food.count
      # @foodprices = @food.sum(:price)
      # flash[:success] = "Shopping list updated successfully."
      # redirect_to shopping_list_index_path
    # else 
      # flash[:alert] = "Shopping list not updated."  
      # @food = []
    # end
  # end
  # def generate
  #   @shopping_list = "Shopping list for #{current_user.name}:\n"
  #   current_user.foods.each do |food|
  #     @shopping_list += "- #{food.name}\n"
  #   end

  #   respond_to do |format|
  #     format.text do
  #       render plain: @shopping_list
  #     end
  #   end
  # end
# end

# class ShoppingListController < ApplicationController
#   def index
#     if params[:button_clicked]
#       @food = current_user.foods.left_outer_joins(:recipe_foods).where(recipe_foods: { id: nil }).includes(:recipe_foods)
#       @foodcounts = @food.count
#       @foodprices = @food.sum(:price)
#       flash[:success] = "Shopping list updated successfully."
#       render :index
#     else 
#       flash[:alert] = "Shopping list not updated."  
#       @food || @food = []
#     end
#   end
# end

class ShoppingListController < ApplicationController
  def index
    @food = []
    if params[:button_clicked]
      @food = current_user.foods.left_outer_joins(:recipe_foods).where(recipe_foods: { id: nil }).includes(:recipe_foods)
      @foodcounts = @food.count
      @foodprices = @food.sum(:price)
      flash[:success] = "Shopping list updated successfully."
      # session[:shopping_list] = { food: @food, foodcounts: @foodcounts, foodprices: @foodprices }
    elsif @food.present?
      @foodcounts = @food.count
      @foodprices = @food.sum(:price)
      flash[:success] = "Shopping list updated successfully."
    else 
      flash[:alert] = "Shopping list not updated."  
      @food = []
      @foodcounts = 0
      @foodprices = 0
    end
  end
end

