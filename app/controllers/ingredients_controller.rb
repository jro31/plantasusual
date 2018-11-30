class IngredientsController < ApplicationController
  def create
    new_ingredient = Ingredient.new(ingredient_params)
    new_ingredient.name = params[:amount][:ingredient].downcase
    new_ingredient.save
  end
end

def ingredient_params
  params.require(:ingredient).permit(:name)
end
