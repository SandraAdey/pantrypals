class RecipesController < ApplicationController
  def index
    @recent_recipes = current_user.recipes.order(created_at: :desc).limit(3)

    # @ingredients = Recipe.search

    # access info in api and add these key words together
    # @recipe = Recipe.new

    if params['recipe'].present? && params['recipe']['ingredients'].present?
      @recipes = Recipe.search(params['recipe']['ingredients'])
      # redirect_to recipes_path(@recipes) fix this one with new page
      unless @recipes
        @recipes = Recipe.all
      end
    else
      @recipes = []
    end
  end

  def show
    @recipe = Recipe.search_recipe(params[:id])
    @favorite = current_user.favorites.find_by_recipe_id(params[:id])
    # @recipe_review = Recipe.find_by_id(params[:id])
    # @recipe_review = current_user.f!(recipe_id: params[:recipe_id])
    @recipe_reviews = Review.where(recipe_id: params[:id])
  end

  # private

  # def review_params
  #   params.require(:review).permit(:username, :title, :description, :rating)
  # end
end
