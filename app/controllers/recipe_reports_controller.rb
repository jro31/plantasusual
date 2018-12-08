class RecipeReportsController < ApplicationController
  def new
    @search_bar_hide = true
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_report = RecipeReport.new
    authorize @recipe_report
  end

  def create
    @recipe_report = RecipeReport.new(recipe_report_params)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_report.recipe = @recipe
    @recipe_report.user = current_user
    authorize @recipe_report
    if @recipe_report.valid?
      @recipe_report.save
      flash[:alert] = "Thank you for reporting this issue"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def index
    @search_bar_hide = true
    @reports = policy_scope(RecipeReport).order(created_at: :desc)
  end

  def update
    @recipe_report = RecipeReport.find(params[:id])
    if @recipe_report.resolved == false
      @recipe_report.resolved = true
    else
      @recipe_report.resolved = false
    end
    authorize @recipe_report
    @recipe_report.save
    redirect_to pages_admin_panel_path
  end
end

private

def recipe_report_params
  params.require(:recipe_report).permit(:report, :user_id, :recipe_id, :resolved)
end
