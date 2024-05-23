class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :instructions
      t.string :ingredients
      t.string :categories

      t.timestamps
    end
  end
end
