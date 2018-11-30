class RecipeCategoriesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_category = RecipeCategory.new
  end

  def create
    chosen_categories = params[:recipe_category][:category_id]
    chosen_categories.each do |category|
      if category != ""
        chosen_category = { "category_id" => category }
        @recipe_category = RecipeCategory.new(chosen_category)
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_category.recipe = @recipe
        @recipe_category.save
      end
    end
    redirect_to new_recipe_amount_path(@recipe)
  end
end

private

def recipe_category_params
  params.require(:recipe_category).permit(:recipe_id, :category_id)
end
