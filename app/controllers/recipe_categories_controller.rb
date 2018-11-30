class RecipeCategoriesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_category = RecipeCategory.new
  end

  def create
    @recipe_category = RecipeCategory.new(recipe_category_params)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_category.recipe = @recipe
    @recipe_category.save
    redirect_to new_recipe_amount_path(@recipe)
  end
end

private

def recipe_category_params
  params.require(:recipe_category).permit(:recipe_id, :category_id)
end
