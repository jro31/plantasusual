class AmountsController < ApplicationController
  def new
    @search_bar_hide = true
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_categories = RecipeCategory.where(recipe_id: params[:recipe_id])
    @recipe_amounts = Amount.where(recipe_id: params[:recipe_id])
    @amount = Amount.new
  end

  def create
    if Ingredient.exists?(name: params[:amount][:ingredient].downcase)
      @amount = Amount.new(amount_params)
      recipe = Recipe.find(params[:recipe_id])
      @amount.recipe = recipe
      ingredient = Ingredient.find_by name: params[:amount][:ingredient].downcase
      @amount.ingredient = ingredient
      @amount.save
      redirect_to new_recipe_amount_path
    else
      new_ingredient = Ingredient.new(ingredient_params)
      new_ingredient.name = params[:amount][:ingredient].downcase
      new_ingredient.save

      @amount = Amount.new(amount_params)
      recipe = Recipe.find(params[:recipe_id])
      @amount.recipe = recipe
      ingredient = Ingredient.find_by name: params[:amount][:ingredient].downcase
      @amount.ingredient = ingredient
      @amount.save
      redirect_to new_recipe_amount_path
    end
  end

  def destroy
    @amount = Amount.find(params[:id])
    @amount.destroy
    redirect_to new_recipe_amount_path(params[:recipe_id])
  end
end

private

def amount_params
  params.require(:amount).permit(:ingredient_id, :recipe_id, :size, :optional, :unit_id, :preparation_method_id)
end

def ingredient_params
  params.permit(:name)
end
