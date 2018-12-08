class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.recipe = Recipe.find(params[:recipe_id])
    authorize @comment
    if @comment.valid?
      @comment.save
    else
      flash[:alert] = "That is not a valid comment"
    end
    redirect_to recipe_path(@comment.recipe)
  end

  def edit
    @search_bar_hide = true
    @comment = Comment.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    authorize @comment
    if @comment.update(comment_params)
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "That is not a valid comment"
      render :edit
    end
  end
end

private

def comment_params
  params.require(:comment).permit(:body, :user_id, :recipe_id, :deleted)
end
