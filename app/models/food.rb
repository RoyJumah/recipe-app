class Food < ApplicationRecord
  has_many :recipe_food
  has_many :recipe, through: :recipe_food
end
