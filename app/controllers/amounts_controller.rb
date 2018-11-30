class AmountsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_categories = RecipeCategory.where(recipe_id: params[:recipe_id])
    @amount = Amount.new
  end
end
