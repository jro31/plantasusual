class CommentReportsController < ApplicationController
  def new
    @search_bar_hide = true
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:comment_id])
    @comment_report = CommentReport.new
    authorize @comment_report
  end

  def create
    @comment_report = CommentReport.new(comment_report_params)
    @comment = Comment.find(params[:comment_id])
    @comment_report.comment = @comment
    @comment_report.user = current_user
    authorize @comment_report
    @recipe = Recipe.find(params[:recipe_id])
    if @comment_report.valid?
      @comment_report.save
      flash[:alert] = "Thank you for reporting this issue"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def index
    @search_bar_hide = true
    @reports = policy_scope(CommentReport).order(created_at: :desc)
  end

  def update
    @comment_report = CommentReport.find(params[:id])
    if @comment_report.resolved == false
      @comment_report.resolved = true
    else
      @comment_report.resolved = false
    end
    authorize @comment_report
    @comment_report.save
    redirect_to pages_admin_panel_path
  end
end

private

def comment_report_params
  params.require(:comment_report).permit(:report, :user_id, :comment_id, :resolved)
end
