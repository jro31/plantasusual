class AmountsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_categories = RecipeCategory.where(recipe_id: params[:recipe_id])
    @amount = Amount.new
  end

  def create
    @amount = Amount.new(amount_params)
    recipe = Recipe.find(params[:recipe_id])
    @amount.recipe = recipe
    @amount.save
    redirect_to root_path
  end
end

private

def amount_params
  params.require(:amount).permit(:ingredient_id, :recipe_id, :size, :optional, :unit_id, :preparation_method_id)
end
