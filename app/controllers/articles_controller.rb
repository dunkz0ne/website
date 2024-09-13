# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_journalist, only: [:new, :create]
  before_action :authorize_owner, only: [:edit, :update, :delete]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @user = current_user
    @team = Team.find(@user.team_id)

    @articles = Article.where(team_id: @team.id, draft: false).order(created_at: :desc)

    @articles.each do |article|
      article.user = User.find(article.user_id)
    end

    @releases = Release.where(team_id: @team.id).order(created_at: :desc)

    @releases.each do |release|
      release.user = User.find(release.user_id)
    end

    @other_articles = Article.where(draft: false).where.not(team_id: @team.id).order(created_at: :desc).limit(5)
    @other_articles_teams = []
    @other_articles.each do |article|
      article.user = User.find(article.user_id)
      @other_articles_teams << Team.find(article.team_id)
    end

  end

  def show
    @article = Article.find(params[:id])
    @team = Team.find(@article.team_id)
    @current_user_team = Team.find(current_user.team_id)
    @is_saved = Save.where(user_id: current_user.id, article_id: @article.id).first

    @comments = Comment.where(article_id: @article.id).order(created_at: :desc)
    @comments.each do |comment|
      comment.user = User.find(comment.user_id)
    end
  end

  def new
    @article = Article.new
    @user = current_user
    @team = Team.find(@user.team_id)
  end

  def create
    article_params_with_team_id = article_params.merge(team_id: current_user.team_id)
    @article = current_user.articles.new(article_params_with_team_id)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end


  def edit
    @user = current_user
    @team = Team.find(@user.team_id)

  end

  def update
    if article_params[:image].present?
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    else
      @article.update(article_params.except(:image))
      redirect_to @article, notice: 'Article was successfully updated.'
    end
  end

  def destroy
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy
    if params[:admin] == 'true'
      redirect_to admin_dashboard_user_path, notice: 'Article was successfully destroyed.'
    else
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end
  end

  def save
    @user = current_user
    @article = Article.find(params[:id])
    @save = Save.new(user_id: @user.id, article_id: @article.id)
    @save.save
    redirect_to article_path(@article)
  end

  def unsave
    @user = current_user
    @article = Article.find(params[:id])
    @save = Save.where(user_id: @user.id, article_id: @article.id).first
    @save.destroy
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :draft, :image, :admin)
  end

  def authorize_journalist
    unless current_user.is_a?(Journalist) || current_user.is_a?(Admin)
      redirect_to user_dashboard_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def authorize_owner
    @article = Article.find(params[:id])
    unless @article.user_id == current_user.id || current_user.is_a?(Admin)
      redirect_to articles_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def record_not_found
    flash[:alert] = "L'articolo con ID #{params[:id]} non è stato trovato."
    redirect_to articles_path
  end

end
