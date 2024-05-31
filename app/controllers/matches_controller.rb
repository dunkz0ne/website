class MatchesController < ApplicationController
  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @team = Team.find(@user.team_id) if @user

    # PLAYOFFS

    url = URI.parse("http://localhost:5001/api/teams/#{@team.api}/schedule/playoffs")
    response = Net::HTTP.get_response(url)

    playoffs_data_raw = JSON.parse(response.body) # ["Team_ID", "Game_ID", "GAME_DATE", "MATCHUP", "WL", "W", "L", "W_PCT", "MIN", "FGM", "FGA", "FG_PCT", "FG3M", "FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TOV", "PF", "PTS"]
    playoffs_data = playoffs_data_raw['resultSets'][0]['rowSet'].map { |game| { team_id: game[0], game_id: game[1], game_date: game[2], matchup: game[3], wl: game[4], w: game[5], l: game[6], w_pct: game[7], min: game[8], fgm: game[9], fga: game[10], fg_pct: game[11], fg3m: game[12], fg3a: game[13], fg3_pct: game[14], ftm: game[15], fta: game[16], ft_pct: game[17], oreb: game[18], dreb: game[19], reb: game[20], ast: game[21], stl: game[22], blk: game[23], tov: game[24], pf: game[25], pts: game[26] }}

    @playoffs_schedule = []

    playoffs_data.each do |game|
        if game[:matchup].include?('@')
            team_list = game[:matchup].split(' @ ')
            home_team = team_list[1]
            away_team = team_list[0]
        else 
            team_list = game[:matchup].split(' vs. ')
            home_team = team_list[0]
            away_team = team_list[1]
        end

        @playoffs_schedule.push({ home_team: home_team, away_team: away_team, game_date: game[:game_date], game_id: game[:game_id], wl: game[:wl], home_points: nil, away_points: nil })
    end


    @playoffs_schedule.each do |game|
        url = URI.parse("http://localhost:5001/api/matches/#{game[:game_id]}")
        response = Net::HTTP.get_response(url)

        match_data = JSON.parse(response.body)
        game[:home_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][6]).first
        game[:away_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][7]).first
        game[:home_points] = match_data['resultSets'][5]['rowSet'][0][22]
        game[:away_points] = match_data['resultSets'][5]['rowSet'][1][22]
    end

    # REGULAR SEASON

    url = URI.parse("http://localhost:5001/api/teams/#{@team.api}/schedule/regular")
    response = Net::HTTP.get_response(url)

    regular_data_raw = JSON.parse(response.body) # ["Team_ID", "Game_ID", "GAME_DATE", "MATCHUP", "WL", "W", "L", "W_PCT", "MIN", "FGM", "FGA", "FG_PCT", "FG3M", "FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TOV", "PF", "PTS"]
    regular_data = regular_data_raw['resultSets'][0]['rowSet'].map { |game| { team_id: game[0], game_id: game[1], game_date: game[2], matchup: game[3], wl: game[4], w: game[5], l: game[6], w_pct: game[7], min: game[8], fgm: game[9], fga: game[10], fg_pct: game[11], fg3m: game[12], fg3a: game[13], fg3_pct: game[14], ftm: game[15], fta: game[16], ft_pct: game[17], oreb: game[18], dreb: game[19], reb: game[20], ast: game[21], stl: game[22], blk: game[23], tov: game[24], pf: game[25], pts: game[26] }}
    regular_data = regular_data[0..9]

    @regular_schedule = []

    regular_data.each do |game|
        if game[:matchup].include?('@')
            team_list = game[:matchup].split(' @ ')
            home_team = team_list[1]
            away_team = team_list[0]
        else 
            team_list = game[:matchup].split(' vs. ')
            home_team = team_list[0]
            away_team = team_list[1]
        end

        @regular_schedule.push({ home_team: home_team, away_team: away_team, game_date: game[:game_date], game_id: game[:game_id], wl: game[:wl], home_points: nil, away_points: nil })
    end


    @regular_schedule.each do |game|
        url = URI.parse("http://localhost:5001/api/matches/#{game[:game_id]}")
        response = Net::HTTP.get_response(url)

        match_data = JSON.parse(response.body)
        game[:home_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][6]).first
        game[:away_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][7]).first
        game[:home_points] = match_data['resultSets'][5]['rowSet'][0][22]
        game[:away_points] = match_data['resultSets'][5]['rowSet'][1][22]
    end

  end

  def show
  end
end
