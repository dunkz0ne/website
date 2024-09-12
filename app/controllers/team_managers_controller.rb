class TeamManagersController < ApplicationController

  before_action :authenticate_user!

  def index
    @team_manager = TeamManager.all
  end

  def show
    @team_manager = current_user
    redirect_to @team_manager
  end

  def new
    @team_manager = TeamManager.new
  end

  def create
    @team_manager = TeamManager.new(team_manager_params)

    respond_to do |format|
      if @team_manager.save
        format.html { redirect_to @team_manager, notice: "Journalist was successfully created." }
        format.json { render :show, status: :created, location: @team_manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team_manager = current_user
    respond_to do |format|
      if @team_manager.update(team_manager_params)
        format.html { redirect_to @team_manager, notice: "Journalist was successfully updated." }
        format.json { render :show, status: :ok, location: @team_manager }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team_manager = current_user
    @team_manager.destroy
    respond_to do |format|
      format.html { redirect_to team_manager_url, notice: "Journalist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def team_manager_params
      params.require(:team_manager).permit(:team_id, :bio, :photo)
    end

end
