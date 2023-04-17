class AddRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_food do |t|
      t.integer :quantity
      t.integer :recipe_id
      t.integer :food_id
      t.timestamps
    end
  end
end
