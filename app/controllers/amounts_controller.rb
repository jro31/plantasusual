class AmountsController < ApplicationController
  def new
    @search_bar_hide = true
    @recipe = Recipe.find(params[:recipe_id])
    @amounts = Amount.where(recipe_id: params[:recipe_id])
    @amount = Amount.new
    authorize @amount
  end

  def create
    if Ingredient.exists?(name: params[:amount][:ingredient].downcase) == false
      new_ingredient = Ingredient.new(ingredient_params)
      new_ingredient.name = params[:amount][:ingredient].downcase
      new_ingredient.save
    end
    @amount = Amount.new(amount_params)
    recipe = Recipe.find(params[:recipe_id])
    @amount.recipe = recipe
    ingredient = Ingredient.find_by name: params[:amount][:ingredient].downcase
    @amount.ingredient = ingredient
    if current_user == recipe.user
      authorize @amount
    end
    @amount.save
    redirect_to new_recipe_amount_path
  end

  def destroy
    @amount = Amount.find(params[:id])
    authorize @amount
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
