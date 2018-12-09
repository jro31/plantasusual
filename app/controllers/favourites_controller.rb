class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.user = current_user
    @favourite.recipe = Recipe.find(params[:recipe_id])
    authorize @favourite
    @favourite.save
    flash[:notice] = "Recipe favourited"
    redirect_back(fallback_location: recipes_path)
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    authorize @favourite
    @favourite.destroy
    flash[:notice] = "Recipe unfavourited"
    redirect_back(fallback_location: recipes_path)
  end
end

private

def favourite_params
  params.permit(:user_id, :recipe_id)
end
