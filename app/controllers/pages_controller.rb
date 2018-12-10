class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @logo_hide = true
    @search_bar_hide = true
  end

  def admin_panel
    @search_bar_hide = true
    @recipe_reports = policy_scope(RecipeReport).order(created_at: :desc)
    @comment_reports = policy_scope(CommentReport).order(created_at: :desc)
    @users = User.all.order(:id)
    @recipes = Recipe.all.order(:id)
    @comments = Comment.all.order(:id)
    @recipe_reports_all = RecipeReport.all.order(:id)
    @comment_reports_all = CommentReport.all.order(:id)
  end
end
