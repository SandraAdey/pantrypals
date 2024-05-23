# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :recipes
  has_many :reviews
  has_many :favorites
  has_many :ingredients
  has_many :favorited_recipes, through: :favorites, source: :recipe

  def favorite(recipe)
    favorites.create(recipe: recipe)
  end

  def unfavorite(recipe)
    favorites.find_by(recipe: recipe)&.destroy
  end

  def favorited?(recipe)
    favorited_recipes.include?(recipe)
  end
end
