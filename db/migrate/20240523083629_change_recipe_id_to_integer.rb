class ChangeRecipeIdToInteger < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :recipe, foreign_key: true, index: false
    add_column :reviews, :recipe_id, :integer
  end
end
