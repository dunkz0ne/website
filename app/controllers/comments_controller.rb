class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    @comment.parent_id = params[:parent_id] if params[:parent_id]

    if @comment.save
      redirect_to @article, notice: 'New comment added.'
    else
      redirect_to @article, alert: 'Error adding comment.'
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article), notice: 'Comment deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
