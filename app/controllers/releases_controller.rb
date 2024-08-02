class ReleasesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_team_manager, only: [:new, :create]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @article = Release.all
  end

  def show
    @article = Release.find(params[:id])
    @author = User.find(@article.user_id)
    @user = User.find(@article.user_id)
    @current_user_team = Team.find(@current_user.team_id)
    @team = Team.find(@author.team_id)
  end

  def new
    @release = Release.new
  end

  def edit
  end

  def update
    if @release.update(release_params)
      redirect_to @release, notice: 'Release was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @release = current_user.releases.build(release_params)
    if @release.save
      redirect_to @release, notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  def delete
    @release = Release.find(params[:id])
    @release.destroy
    redirect_to articles_path, notice: 'Release was successfully deleted.'
  end

  private

  def release_params
    params.require(:release).permit(:title, :content)
  end

  def authorize_team_manager
    unless current_user.is_a?(TeamManager) || current_user.is_a?(Admin)
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def authorize_owner
    @release = Release.find(params[:id])
    unless current_user.id == @release.user_id || current_user.is_a?(Admin)
      redirect_to release_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
