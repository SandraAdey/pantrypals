class CorrectRatingInReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :raiting, :string
    add_column :reviews, :rating, :integer
  end
end
