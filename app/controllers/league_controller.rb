class LeagueController < ApplicationController
  def index
    url = URI.parse("http://localhost:5001/api/league/standings")
    response = Net::HTTP.get_response(url)

    @user = current_user
    @team = Team.where(id: @user.team_id).first if @user

    standings_data_raw = JSON.parse(response.body) # ["LeagueID", "SeasonID", "TeamID", "TeamCity", "TeamName", "Conference", "ConferenceRecord", "PlayoffRank", "ClinchIndicator", "Division", "DivisionRecord", "DivisionRank", "WINS", "LOSSES", "WinPCT", "LeagueRank", "Record", "HOME", "ROAD", "L10", "Last10Home", "Last10Road", "OT", "ThreePTSOrLess", "TenPTSOrMore", "LongHomeStreak", "strLongHomeStreak", "LongRoadStreak", "strLongRoadStreak", "LongWinStreak", "LongLossStreak", "CurrentHomeStreak", "strCurrentHomeStreak", "CurrentRoadStreak", "strCurrentRoadStreak", "CurrentStreak", "strCurrentStreak", "ConferenceGamesBack", "DivisionGamesBack", "ClinchedConferenceTitle", "ClinchedDivisionTitle", "ClinchedPlayoffBirth", "EliminatedConference", "EliminatedDivision", "AheadAtHalf", "BehindAtHalf", "TiedAtHalf", "AheadAtThird", "BehindAtThird", "TiedAtThird", "Score100PTS", "OppScore100PTS", "OppOver500", "LeadInFGPCT", "LeadInReb", "FewerTurnovers", "PointsPG", "OppPointsPG", "DiffPointsPG", "vsEast", "vsAtlantic", "vsCentral", "vsSoutheast", "vsWest", "vsNorthwest", "vsPacific", "vsSouthwest", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "PreAS", "PostAS"]
    @standings = standings_data_raw['resultSets'][0]['rowSet'].map { |team| { team_id: team[2], team_city: team[3], team_name: team[4], conference: team[5], conference_record: team[6], playoff_rank: team[7], clinch_indicator: team[8], division: team[9], division_record: team[10], division_rank: team[11], wins: team[12], losses: team[13], win_pct: team[14], league_rank: team[15], record: team[16], home: team[17], road: team[18], l10: team[19], last_10_home: team[20], last_10_road: team[21], ot: team[22], three_pts_or_less: team[23], ten_pts_or_more: team[24], long_home_streak: team[25], str_long_home_streak: team[26], long_road_streak: team[27], str_long_road_streak: team[28], long_win_streak: team[29], long_loss_streak: team[30], current_home_streak: team[31], str_current_home_streak: team[32], current_road_streak: team[33], str_current_road_streak: team[34], current_streak: team[35], str_current_streak: team[36], conference_games_back: team[37], division_games_back: team[38], clinched_conference_title: team[39], clinched_division_title: team[40], clinched_playoff_birth: team[41], eliminated_conference: team[42], eliminated_division: team[43], ahead_at_half: team[44], behind_at_half: team[45], tied_at_half: team[46], ahead_at_third: team[47], behind_at_third: team[48], tied_at_third: team[49], score_100_pts: team[50], opp_score_100_pts: team[51], opp_over_500: team[52], lead_in_fg_pct: team[53], lead_in_reb: team[54], fewer_turnovers: team[55], points_pg: team[56], opp_points_pg: team[57], diff_points_pg: team[58], vs_east: team[59], vs_atlantic: team[60]} }

    @standings.each do |team|
      team[:team_id_api] = team[:team_id]
      team[:team_id] = Team.where(api: team[:team_id_api]).first.id
    end

    url = URI.parse("http://localhost:5001/api/league/leaders")
    response = Net::HTTP.get_response(url)

    @leaders_data_raw = JSON.parse(response.body) # ["PLAYER_ID", "RANK", "PLAYER", "TEAM_ID", "TEAM", "GP", "MIN", "FGM", "FGA", "FG_PCT", "FG3M", "FG3A", "FG3_PCT", "FTM", "FTA", "FT_PCT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TOV", "PF", "PTS", "EFF", "AST_TOV", "STL_TOV"]
    @leaders = @leaders_data_raw['resultSet']['rowSet'].map { |player| { player_id: player[0], rank: player[1], player: player[2], team_id: player[3], team: player[4], gp: player[5], min: player[6], fgm: player[7], fga: player[8], fg_pct: player[9], fg3m: player[10], fg3a: player[11], fg3_pct: player[12], ftm: player[13], fta: player[14], ft_pct: player[15], oreb: player[16], dreb: player[17], reb: player[18], ast: player[19], stl: player[20], blk: player[21], tov: player[22], pf: player[23], pts: player[24], eff: player[25], ast_tov: player[26], stl_tov: player[27] } }
  end
end
