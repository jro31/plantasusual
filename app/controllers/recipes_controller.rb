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
    if params[:query].present?
      sql_query = " \
        recipes.name ILIKE :query \
        OR recipes.method ILIKE :query \
        OR users.username ILIKE :query \
        "
      @recipes = Recipe.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @amounts = Amount.where(recipe_id: params[:id])
    @categories = RecipeCategory.where(recipe_id: params[:id])
    @equipments = RecipeEquipment.where(recipe_id: params[:id])
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @times = []
    180.times do |n|
      if n % 5 == 0
        @times << n + 5
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end
end

private

def recipe_params
  params.require(:recipe).permit(:photo, :method, :user_id, :name, :servings, :cooking_time)
end
