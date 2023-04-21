class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy
  has_many :recipes, through: :recipe_foods, class_name: 'Recipe'

  validates :name, presence: true
  validates :measurement_unit, presence: true
end
