class CreateJoinTableRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.bigint :quantity, default: 0
      t.references :food, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.references :recipe, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.timestamps
    end
  end
end
