# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_journalist, only: [:new, :create]

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find(session[:user_id]) if session[:user_id]
    if @user.nil?
      @article = @user.articles.new(article_params)
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    else
      redirect_to articles_path, notice: 'You are not authorized to create an article.'
    end
  end


  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def authorize_journalist
    unless current_user.is_a?(Journalist)
      redirect_to user_dashboard_path, alert: 'You are not authorized to perform this action.'
    end
  end

end
