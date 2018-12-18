class RecipesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @search_bar_hide = true
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.name = @recipe.name.capitalize
    @recipe.user = current_user
    authorize @recipe
    if @recipe.valid?
      @recipe.save
      redirect_to edit_recipe_path(@recipe)
    else
      @recipe.name = nil
      render :new
    end
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR method ILIKE :query"
      @recipes = policy_scope(Recipe).where(sql_query, query: "%#{params[:query]}%")
    else
      @recipes = policy_scope(Recipe).order(created_at: :desc)
      # WHEN YOU USE THE policy_scope METHOD, PUNDIT WILL CALL YOUR RESOLVE METHOD
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @amounts = Amount.where(recipe_id: params[:id])
    @categories = @recipe.categories
    @equipments = @recipe.equipment
    @recipe_relates = RecipeRelate.where(relater_id: params[:id])

    @other_recipes = Recipe.all.order(:name)
    @recipe_relate = RecipeRelate.new

    @comment = Comment.new
  end

  def edit
    @search_bar_hide = true
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @times = []
    180.times do |n|
      if n % 5 == 0
        @times << n + 5
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if params[:commit] == "Add categories"
      @recipe.categories_added = true
    end
    if params[:commit] == "Add equipment"
      @recipe.equipment_added = true
    end
    authorize @recipe
    @recipe.update(recipe_params)
    if @recipe.equipment_added == false
      redirect_to edit_recipe_path(@recipe)
    elsif @recipe.method == nil
      redirect_to new_recipe_amount_path(@recipe)
    else
      redirect_to recipe_path(@recipe)
    end
  end

  def mark_as_deleted
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.mark_as_deleted!
    redirect_to recipes_path
  end
end

private

def recipe_params
  params.require(:recipe).permit(:photo, :method, :user_id, :name, :servings, :cooking_time, :deleted, category_ids:[], equipment_ids:[])
end
