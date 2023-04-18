class User < ApplicationRecord
  has_many :recipe, foreign_key: :user_id
  has_many :food, foreign_key: :user_id

  validates :name, presence: true
end
