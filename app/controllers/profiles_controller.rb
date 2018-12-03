class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @recipes = Recipe.where(user_id: params[:id]).order(:name)
  end
end
