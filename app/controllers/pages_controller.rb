class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @logo_hide = true
    @search_bar_hide = true
  end
end
