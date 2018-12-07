class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.recipe = Recipe.find(params[:recipe_id])
    authorize @comment
    @comment.save
    redirect_to recipe_path(@comment.recipe)
  end
end

private

def comment_params
  params.require(:comment).permit(:body, :user_id, :recipe_id)
end
