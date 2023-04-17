class Recipe < ApplicationRecord
  has_many :recipe_food
  has_many :food, through: :recipe_food
end
