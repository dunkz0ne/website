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

  def like
    @comment = Comment.find(params[:id])
    @like = Like.new(comment_id: @comment.id, user_id: current_user.id)
    @like.save
    redirect_to article_path(id: @comment.article_id), notice: 'Liked comment'
    
  end

  def unlike
    @like = Like.find_by(comment_id: params[:id], user: current_user)
    @like.destroy
    redirect_to @like.comment.article
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
