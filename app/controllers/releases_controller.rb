class ReleasesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_team_manager, only: [:new, :create]

  def index
    @article = Release.all
  end

  def show
    @article = Release.find(params[:id])
  end

  def new
    @release = Release.new
  end

  def create
    @release = current_user.releases.build(release_params)
    if @release.save
      redirect_to @release, notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  private

  def release_params
    params.require(:release).permit(:title, :content)
  end

  def authorize_team_manager
    unless current_user.is_a?(TeamManager)
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
