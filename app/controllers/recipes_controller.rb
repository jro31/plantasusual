class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.valid?
    @recipe.save
    redirect_to new_recipe_recipe_category_path(@recipe)
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end

private

def recipe_params
  params.require(:recipe).permit(:photo, :method, :user_id, :name, :servings, :cooking_time)
end
