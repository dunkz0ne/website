class MatchesController < ApplicationController
    def index
      @user = current_user
      @team = Team.find(@user.team_id) if @user

      # PLAYOFFS

      url = URI.parse("http://localhost:5001/api/teams/#{@team.api}/schedule/playoffs")
      response = Net::HTTP.get_response(url)

      playoffs_data_raw = JSON.parse(response.body) # ["Team_ID", "Game_ID", "GAME_DATE", "MATCHUP", "WL", "W", "L", "W_PCT", "MIN", "FGM", "FGA", "FG_PCT", "FG3M", "FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TOV", "PF", "PTS"]
      playoffs_data = playoffs_data_raw['resultSets'][0]['rowSet'].map { |game| { team_id: game[0], game_id: game[1], game_date: game[2], matchup: game[3], wl: game[4], w: game[5], l: game[6], w_pct: game[7], min: game[8], fgm: game[9], fga: game[10], fg_pct: game[11], fg3m: game[12], fg3a: game[13], fg3_pct: game[14], ftm: game[15], fta: game[16], ft_pct: game[17], oreb: game[18], dreb: game[19], reb: game[20], ast: game[21], stl: game[22], blk: game[23], tov: game[24], pf: game[25], pts: game[26] }}
  
      @matches_schedule_playoffs = []
  
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
  
          @matches_schedule_playoffs.push({ home_team: home_team, away_team: away_team, game_date: game[:game_date], game_id: game[:game_id], wl: game[:wl], home_points: nil, away_points: nil })
      end
  
      @n_playoffs = @matches_schedule_playoffs.length
  
      # REGULAR SEASON

      @matches_schedule_regular = []
  
      url = URI.parse("http://localhost:5001/api/teams/#{@team.api}/schedule/regular")
      response = Net::HTTP.get_response(url)

      regular_data_raw = JSON.parse(response.body) # ["Team_ID", "Game_ID", "GAME_DATE", "MATCHUP", "WL", "W", "L", "W_PCT", "MIN", "FGM", "FGA", "FG_PCT", "FG3M", "FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TOV", "PF", "PTS"]
      regular_data = regular_data_raw['resultSets'][0]['rowSet'].map { |game| { team_id: game[0], game_id: game[1], game_date: game[2], matchup: game[3], wl: game[4], w: game[5], l: game[6], w_pct: game[7], min: game[8], fgm: game[9], fga: game[10], fg_pct: game[11], fg3m: game[12], fg3a: game[13], fg3_pct: game[14], ftm: game[15], fta: game[16], ft_pct: game[17], oreb: game[18], dreb: game[19], reb: game[20], ast: game[21], stl: game[22], blk: game[23], tov: game[24], pf: game[25], pts: game[26] }}
      regular_data = regular_data[0..9]


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
  
          @matches_schedule_regular.push({ home_team: home_team, away_team: away_team, game_date: game[:game_date], game_id: game[:game_id], wl: game[:wl], home_points: nil, away_points: nil })

      end

      @playoffs_schedule = []
      @regular_schedule = []
  
      @matches_schedule_playoffs.each_with_index do |game, index|


          if index > params[:number].to_i - 1
              break
          end

          url = URI.parse("http://localhost:5001/api/matches/#{game[:game_id]}")
          response = Net::HTTP.get_response(url)

          match_data = JSON.parse(response.body)
          game[:home_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][6]).first
          game[:away_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][7]).first
          game[:home_points] = match_data['resultSets'][5]['rowSet'][0][22]
          game[:away_points] = match_data['resultSets'][5]['rowSet'][1][22]
  
            @playoffs_schedule.push(game)
      end

      @matches_schedule_regular.each_with_index do |game, index|
          if index > params[:number].to_i - 1
              break
          end
  
          url = URI.parse("http://localhost:5001/api/matches/#{game[:game_id]}")
          response = Net::HTTP.get_response(url)
  
          match_data = JSON.parse(response.body)
          game[:home_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][6]).first
          game[:away_team] = Team.where(api: match_data['resultSets'][0]['rowSet'][0][7]).first
          game[:home_points] = match_data['resultSets'][5]['rowSet'][0][22]
          game[:away_points] = match_data['resultSets'][5]['rowSet'][1][22]
  
            @regular_schedule.push(game)
      end

    end

    def show
      @user = current_user
      @team = Team.find(@user.team_id) if @user

      @match = params[:id]

      url = URI.parse("http://localhost:5001/api/matches/#{@match}")
      response = Net::HTTP.get_response(url)
  
      match_data = JSON.parse(response.body)
  
      match_summary = match_data['resultSets'][0]['rowSet'][0] # ["GAME_DATE_EST", "GAME_SEQUENCE", "GAME_ID", "GAME_STATUS_ID", "GAME_STATUS_TEXT", "GAMECODE", "HOME_TEAM_ID", "VISITOR_TEAM_ID", "SEASON", "LIVE_PERIOD", "LIVE_PC_TIME", "NATL_TV_BROADCASTER_ABBREVIATION","LIVE_PERIOD_TIME_BCAST","WH_STATUS"]
      @match_summary = {game_date_est: match_summary[0], game_sequence: match_summary[1], game_id: match_summary[2], game_status_id: match_summary[3], game_status_text: match_summary[4], gamecode: match_summary[5], home_team_id: match_summary[6], visitor_team_id: match_summary[7], season: match_summary[8], live_period: match_summary[9], live_pc_time: match_summary[10], natl_tv_broadcaster_abbreviation: match_summary[11], live_period_time_bcast: match_summary[12], wh_status: match_summary[13]}
      
      match_officials = match_data['resultSets'][2]['rowSet']
      @match_officials = match_officials.map { |official| {first_name: official[1], last_name: official[2], jersey_number: official[3]} }

      inactive_players = match_data['resultSets'][3]['rowSet'] # ["PLAYER_ID","FIRST_NAME","LAST_NAME","JERSEY_NUM","TEAM_ID","TEAM_CITY","TEAM_NAME","TEAM_ABBREVIATION"],
      @inactive_players = inactive_players.map { |player| {id: player[0], first_name: player[1], last_name: player[2], jersey_number: player[3], team_id: player[4], team_city: player[5], team_name: player[6], team_abbreviation: player[7]} }

      match_info = match_data['resultSets'][4]['rowSet'][0] # ["GAME_DATE", "ATTENDANCE", "GAME_TIME"]
      @match_info = {game_date: match_info[0], attendance: match_info[1], game_time: match_info[2]}
  
      match_linescore = match_data['resultSets'][5]['rowSet'] # ["GAME_DATE_EST", "GAME_SEQUENCE", "GAME_ID", "TEAM_ID", "TEAM_ABBREVIATION", "TEAM_CITY_NAME", "TEAM_NICKNAME", "TEAM_WINS_LOSSES", "PTS_QTR1", "PTS_QTR2", "PTS_QTR3", "PTS_QTR4", "PTS_OT1", "PTS_OT2", "PTS_OT3", "PTS_OT4", "PTS_OT5", "PTS_OT6", "PTS_OT7", "PTS_OT8", "PTS_OT9", "PTS_OT10", "PTS"]
      match_linescore = match_linescore.map { |team| {game_date_est: DateTime.parse(team[0]), team_id: team[3], team_abbreviation: team[4], team_city_name: team[5], team_nickname: team[6], team_wins_losses: team[7], pts_qtr1: team[8], pts_qtr2: team[9], pts_qtr3: team[10], pts_qtr4: team[11], pts_ot1: team[12], pts_ot2: team[13], pts_ot3: team[14], pts_ot4: team[15], pts_ot5: team[16], pts_ot6: team[17], pts_ot7: team[18], pts_ot8: team[19], pts_ot9: team[20], pts_ot10: team[21], pts: team[22]} }
  
      @match_linescore_home = match_linescore[0]
      @match_linescore_away = match_linescore[1]  
  
      match_last_meeting = match_data['resultSets'][6]['rowSet'][0] # ["GAME_ID", "LAST_GAME_ID", "LAST_GAME_DATE_EST", "LAST_GAME_HOME_TEAM_ID", "LAST_GAME_HOME_TEAM_CITY", "LAST_GAME_HOME_TEAM_NAME", "LAST_GAME_HOME_TEAM_ABBREVIATION", "LAST_GAME_HOME_TEAM_POINTS", "LAST_GAME_VISITOR_TEAM_ID", "LAST_GAME_VISITOR_TEAM_CITY", "LAST_GAME_VISITOR_TEAM_NAME", "LAST_GAME_VISITOR_TEAM_CITY1", "LAST_GAME_VISITOR_TEAM_POINTS"]
      @match_last_meeting = {game_id: match_last_meeting[0], last_game_id: match_last_meeting[1], last_game_date_est: DateTime.parse(match_last_meeting[2]), last_game_home_team_id: match_last_meeting[3], last_game_home_team_city: match_last_meeting[4], last_game_home_team_name: match_last_meeting[5], last_game_home_team_abbreviation: match_last_meeting[6], last_game_home_team_points: match_last_meeting[7], last_game_visitor_team_id: match_last_meeting[8], last_game_visitor_team_city: match_last_meeting[9], last_game_visitor_team_name: match_last_meeting[10], last_game_visitor_team_city1: match_last_meeting[11], last_game_visitor_team_points: match_last_meeting[12]}
  
      @last_meeting_home_team = Team.find_by(api: @match_last_meeting[:last_game_home_team_id])
      @last_meeting_away_team = Team.find_by(api: @match_last_meeting[:last_game_visitor_team_id])

      @away_team = Team.find_by(api: @match_summary[:visitor_team_id])
      @home_team = Team.find_by(api: @match_summary[:home_team_id])

      url = URI.parse("http://localhost:5001/api/teams/#{@match_summary[:home_team_id].to_s}/roster")
      response = Net::HTTP.get_response(url)
  
      home_team_data = JSON.parse(response.body)
  
      @home_team_players = home_team_data['resultSets'][0] # ["TeamID", "SEASON", "LeagueID", "PLAYER", "NICKNAME", "PLAYER_SLUG", "NUM", "POSITION", "HEIGHT", "WEIGHT", "BIRTH_DATE", "AGE", "EXP", "SCHOOL", "PLAYER_ID", "HOW_ACQUIRED"],
      @home_team_players = @home_team_players['rowSet'].map { |player| {id: player[14], name: player[3], nickname: player[4], num: player[6], position: player[7] } }  

      url = URI.parse("http://localhost:5001/api/teams/#{@match_summary[:visitor_team_id].to_s}/roster")
      response = Net::HTTP.get_response(url)
  
      away_team_data = JSON.parse(response.body)
  
      @away_team_players = away_team_data['resultSets'][0] # ["TeamID", "SEASON", "LeagueID", "PLAYER", "NICKNAME", "PLAYER_SLUG", "NUM", "POSITION", "HEIGHT", "WEIGHT", "BIRTH_DATE", "AGE", "EXP", "SCHOOL", "PLAYER_ID", "HOW_ACQUIRED"],
      @away_team_players = @away_team_players['rowSet'].map { |player| {id: player[14], name: player[3], nickname: player[4], num: player[6], position: player[7] } }  

    end
  end
