class RemoveRecipeIdFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_column :favorites, :recipe_id
    add_column :favorites, :recipe_id, :integer
  end
end
