class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: :recipe_id
  belongs_to :food, foreign_key: :food_id
end
