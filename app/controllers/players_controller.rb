class PlayersController < ApplicationController

  before_action :authenticate_user!

  def show

    @user = current_user
    @current_user_team = Team.where(id: @user.team_id).first

    @player = params[:id]

    url = URI.parse("http://localhost:5001/api/players/#{@player}/profile")
    response = Net::HTTP.get_response(url)

    begin
      player_data = JSON.parse(response.body) # ["PERSON_ID", "FIRST_NAME", "LAST_NAME", "DISPLAY_FIRST_LAST", "DISPLAY_LAST_COMMA_FIRST", "DISPLAY_FI_LAST", "PLAYER_SLUG", "BIRTHDATE", "SCHOOL", "COUNTRY", "LAST_AFFILIATION", "HEIGHT", "WEIGHT", "SEASON_EXP", "JERSEY", "POSITION", "ROSTERSTATUS", "GAMES_PLAYED_CURRENT_SEASON_FLAG", "TEAM_ID", "TEAM_NAME", "TEAM_ABBREVIATION", "TEAM_CODE", "TEAM_CITY", "PLAYERCODE", "FROM_YEAR", "TO_YEAR", "DLEAGUE_FLAG", "NBA_FLAG", "GAMES_PLAYED_FLAG", "DRAFT_YEAR", "DRAFT_ROUND", "DRAFT_NUMBER", "GREATEST_75_FLAG"]
    rescue JSON::ParserError
      flash[:error] = "Player not found"
      redirect_to "/404"
      return
    end

    @player_data = player_data['resultSets'][0]['rowSet'].map { |player| {id: player[0], first_name: player[1], last_name: player[2], display_first_last: player[3], display_last_comma_first: player[4], display_fi_last: player[5], player_slug: player[6], birthdate: player[7], school: player[8], country: player[9], last_affiliation: player[10], height: player[11], weight: player[12], season_exp: player[13], jersey: player[14], position: player[15], roster_status: player[16], games_played_current_season_flag: player[17], team_id: player[18], team_name: player[19], team_abbreviation: player[20], team_code: player[21], team_city: player[22], player_code: player[23], from_year: player[24], to_year: player[25], dleague_flag: player[26], nba_flag: player[27], games_played_flag: player[28], draft_year: player[29], draft_round: player[30], draft_number: player[31], greatest_75_flag: player[32]} }[0]

    @team = Team.where(api: @player_data[:team_id]).first

    url = URI.parse("http://localhost:5001/api/players/#{@player}/career")
    response = Net::HTTP.get_response(url)

    seasons_data = JSON.parse(response.body) # ["PLAYER_ID", "SEASON_ID", "LEAGUE_ID", "TEAM_ID", "TEAM_ABBREVIATION", "PLAYER_AGE", "GP", "GS", "MIN", "FGM", "FGA", "FG_PCT", "FG3M", "FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TOV", "PF", "PTS"]
    @seasons = seasons_data['resultSets'][0]['rowSet'].map { |player| {season_id: player[1], league_id: player[2], team_id: player[3], team_abbreviation: player[4], player_age: player[5], gp: player[6], gs: player[7], min: player[8], fgm: player[9], fga: player[10], fg_pct: player[11], fg3m: player[12], fg3a: player[13], fg3_pct: player[14], ftm: player[15], fta: player[16], ft_pct: player[17], oreb: player[18], dreb: player[19], reb: player[20], ast: player[21], stl: player[22], blk: player[23], tov: player[24], pf: player[25], pts: player[26]} }

    if params[:sort_by]
      @seasons = @seasons.sort_by { |season| season[params[:sort_by].to_sym] }
      @seasons.reverse! if params[:order] == 'desc'
    end

    @current_sort_by = params[:sort_by]
    @current_order = params[:order]

  end
end
