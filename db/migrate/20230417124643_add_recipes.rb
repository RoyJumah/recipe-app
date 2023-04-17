class AddRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.string  :description
      t.string :public
      t.integer :user_id
      t.timestamps
    end
  end
end
