class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.recipe = Recipe.find(params[:recipe_id])
    authorize @comment
    if @comment.valid?
      @comment.save
      flash[:notice] = "Comment added"
      send_comment_notification
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
      flash[:notice] = "Comment updated"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "That is not a valid comment"
      render :edit
    end
  end

  def mark_as_deleted
    @comment = Comment.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    authorize @comment
    @comment.mark_as_deleted!
    flash[:notice] = "Comment deleted"
    redirect_to recipe_path(@recipe)
  end
end

private

def comment_params
  params.require(:comment).permit(:body, :user_id, :recipe_id, :deleted)
end

def send_comment_notification
  comment_notification = PrivateMessage.new
  recipe = @comment.recipe
  recipe_owner = @comment.recipe.user
  comment_notification.body = "Someone just commented on your recipe '#{view_context.link_to recipe.name, recipe_path(recipe)}.'"
  comment_notification.receiver = recipe_owner
  comment_notification.sender = User.find(1)
  if comment_notification.receiver != current_user
    comment_notification.save
  end
end
