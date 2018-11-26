class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end
end
