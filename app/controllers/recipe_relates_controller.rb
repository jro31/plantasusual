class RecipeRelatesController < ApplicationController
  def create
    @relater = params[:recipe_id]
    @relatee = params[:recipe_relate][:relatee_id]
    @recipe_relate = RecipeRelate.new(recipe_relate_params)
    @recipe_relate.relater_id = @relater
    @recipe_relate.relatee_id = @relatee
    authorize @recipe_relate
    @recipe_relate.save
    redirect_to recipe_path(@relater)
  end

  def destroy
    @recipe_relate = RecipeRelate.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe_relate
    @recipe_relate.destroy
    redirect_to recipe_path(@recipe)
  end
end

private

def recipe_relate_params
  params.require(:recipe_relate).permit(:relater_id, :relatee_id)
end
