class RecipeRelatesController < ApplicationController
  def new
    @search_bar_hide = true
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_relate = RecipeRelate.new
    authorize @recipe_relate
  end
end
