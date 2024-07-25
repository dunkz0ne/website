# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :check_user, only: %i[edit create update destroy]

  def index
    @articles = Article.accessible_by(current_ability)
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
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

  def check_user
    @article = Article.find_by(journalist_id: session[:user_id])
    if @current_user.nil?
      redirect_to user_dashboard_path, notice: 'You cannot create/edit/update or destroy an article.'
    end
  end
end
