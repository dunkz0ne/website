require 'net/http'
require 'uri'
require 'json'

class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
    @team = Team.find(params[:id])
    @current_user_team = Team.find(current_user.team_id)

    url = URI.parse("http://localhost:5001/api/teams/#{@team.api.to_s}")
    response = Net::HTTP.get_response(url)

    team_data = JSON.parse(response.body)

    @nba_won = team_data['resultSets'][3]['rowSet'].length
    @conference_won = team_data['resultSets'][4]['rowSet'].length
    @division_won = team_data['resultSets'][5]['rowSet'].length

    @hof_players = team_data['resultSets'][6]['rowSet'] # ["PLAYERID", "PLAYER", "POSITION", "JERSEY", "SEASONSWITHTEAM", "YEAR"]
    @hof_players = @hof_players.map { |player| {id: player[0], name: player[1], position: player[2], season_with_team: player[4], year: player[5]} }

    url = URI.parse("http://localhost:5001/api/teams/#{@team.api.to_s}/roster")
    response = Net::HTTP.get_response(url)

    team_data = JSON.parse(response.body)

    @roster = team_data['resultSets'][0] # ["TeamID", "SEASON", "LeagueID", "PLAYER", "NICKNAME", "PLAYER_SLUG", "NUM", "POSITION", "HEIGHT", "WEIGHT", "BIRTH_DATE", "AGE", "EXP", "SCHOOL", "PLAYER_ID", "HOW_ACQUIRED"],
    @roster = @roster['rowSet'].map { |player| {id: player[14], name: player[3], nickname: player[4], num: player[6], position: player[7], height: player[8], weight: player[9], birth_date: player[10], age: player[11], exp: player[12], school: player[13], how_acquired: player[15]} }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :color, :api)
    end

    def record_not_found
      flash[:alert] = "Record not found"
      redirect_to "/teams/#{current_user.team_id}"
    end
end
