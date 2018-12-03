class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @recipes = Recipe.where(user: params[:id]).order(:name)
    @favourites = Favourite.where(user: params[:id])
  end
end

private

def profile_params
  params.permit(:user_id)
end
