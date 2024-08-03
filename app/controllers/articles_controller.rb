# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_journalist, only: [:new, :create]
  before_action :authorize_owner, only: [:edit, :update, :delete]

  def index
    @user = User.find(session[:user_id])
    @team = Team.find(@user.team_id)

    @team_journalist = Journalist.where(team_id: @team.id)
    @articles = Article.where(user_id: @team_journalist.ids, draft: false).order(created_at: :desc)

    @articles.each do |article|
      article.user = User.find(article.user_id)
    end

    @team_manager = TeamManager.where(team_id: @user.team_id)
    @releases = Release.where(user_id: @team_manager.ids)

    @releases.each do |release|
      release.user = User.find(release.user_id)
    end

    @other_articles = Article.where(draft: false).order(created_at: :desc).limit(5)
    @other_articles_teams = []
    @other_articles.each do |article|
      article.user = User.find(article.user_id)
      @other_articles_teams << Team.find(article.user.team_id)
    end

  end

  def show
    @article = Article.find(params[:id])
    @team = Team.find(@article.user.team_id)
    @current_user_team = Team.find(current_user.team_id) 
    @is_saved = Save.where(user_id: session[:user_id], article_id: @article.id).first

    @comments = Comment.where(article_id: @article.id).order(created_at: :desc)
    @comments.each do |comment|
      comment.user = User.find(comment.user_id)
    end
  end

  def new
    @article = Article.new
    @user = User.find(session[:user_id])
    @team = Team.find(@user.team_id)
  end

  def create
    @article = current_user.articles.new(article_params)

    if params[:article][:image].blank?
      @article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'nbaLogo.jpg')), filename: 'nbaLogo.jpg', content_type: 'image/jpeg')
    end
    
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end


  def edit
    @user = User.find(session[:user_id])
    @team = Team.find(@user.team_id)

  end

  def update
    @article = Article.find(params[:id])

    if params[:article][:image].blank? && !@article.image.attached?
      @article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'nbaLogo.jpg')), filename: 'nbaLogo.jpg', content_type: 'image/jpeg')
    end

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  def save
    @user = User.find(session[:user_id]) if session[:user_id]
    @article = Article.find(params[:id])
    @save = Save.new(user_id: @user.id, article_id: @article.id)
    @save.save
    redirect_to article_path(@article)
  end

  def unsave
    @user = User.find(session[:user_id]) if session[:user_id]
    @article = Article.find(params[:id])
    @save = Save.where(user_id: @user.id, article_id: @article.id).first
    @save.destroy
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :draft, :image)
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

end
