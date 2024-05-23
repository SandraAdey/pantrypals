class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.map do |favorite|
      Recipe.search_recipe(favorite.recipe_id)
    end
  end

  def create
    Favorite.create(recipe_id: params["recipe_id"], user_id: current_user.id)
    redirect_to recipe_path(params["recipe_id"]), notice: 'Recipe added to favorites.'
  end

  def destroy
    favorite = Favorite.find(params[:id])
    recipe_id = favorite.recipe_id
    favorite.destroy
    # favorite = current_user.favorites.find_by(recipe_id: params[:recipe_id])
    # favorite.destroy
    redirect_to recipe_path(recipe_id), notice: 'Recipe removed from favorites.'
  end
end
