import 'package:hoop/services/apikey/key.dart'; // get your own nba-Api key

class Urls {
  static final String _apiBaseUrl = "https://api-nba-v1.p.rapidapi.com";
  static final String _teamBaseUrl = "https://www.nba.com/";
  static final String _sioBaseUrl =
      "https://api.sportsdata.io/v3/nba/stats/json/";

  // static String eastStandingsUrl(String year) =>
  //     "$_apiBaseUrl/standings/standard/$year/conference/east/?rapidapi-key=${NbaApi.key}";
  // static String westStandingsUrl(String year) =>
  //     "$_apiBaseUrl/standings/standard/$year/conference/west/?rapidapi-key=${NbaApi.key}";

  // static String southwestDivisionStandingsUrl =
  //     "$_apiBaseUrl/standings/standard/2019/division/southwest/?rapidapi-key=${NbaApi.key}";
  // static String atlanticDivisionStandingsUrl =
  //     "$_apiBaseUrl/standings/standard/2019/division/atlantic/?rapidapi-key=${NbaApi.key}";
  // static String southeastDivisionStandingsUrl =
  //     "$_apiBaseUrl/standings/standard/2019/division/southeast/?rapidapi-key=${NbaApi.key}";
  // static String pacificDivisionStandingsUrl =
  //     "$_apiBaseUrl/standings/standard/2019/division/pacific/?rapidapi-key=${NbaApi.key}";
  // static String northwestDivisionStandingsUrl =
  //     "$_apiBaseUrl/standings/standard/2019/division/northwest/?rapidapi-key=${NbaApi.key}";
  // static String centralDivisionStandingsUrl =
  //     "$_apiBaseUrl/standings/standard/2019/division/central/?rapidapi-key=${NbaApi.key}";

  static String seasonsUrl = "$_apiBaseUrl/seasons/?rapidapi-key=${NbaApi.key}";

  static String getDivisionStandings(String division, String year) {
    return "$_apiBaseUrl/standings/standard/$year/division/$division/?rapidapi-key=${NbaApi.key}";
  }

  static String eastTeamsUrl =
      "$_apiBaseUrl/teams/confName/east/?rapidapi-key=${NbaApi.key}";
  static String westTeamsUrl =
      "$_apiBaseUrl/teams/confName/west/?rapidapi-key=${NbaApi.key}";
  static String seasonGames =
      "$_apiBaseUrl/games/league/standard/2019/?rapidapi-key=${NbaApi.key}";
  static String teamPlayersUrl(String id) =>
      "$_apiBaseUrl/players/teamId/$id/?rapidapi-key=${NbaApi.key}";
  static String link(String team) => _teamBaseUrl + team + "/";

  static String teamGoogleNewsSearch(String team) =>
      //"https://bing-news-search1.p.rapidapi.com/news/search?q=$team&freshness=Day&textFormat=Raw&safeSearch=Off?rapidapi-key=${NbaApi.key}";
      "https://google-search3.p.rapidapi.com/api/v1/news/q=$team?rapidapi-key=${GoogleSearchApi.key}";

  static String teamGoogleImageSearch(String team) =>
      "https://google-search3.p.rapidapi.com/api/v1/images/q=$team?rapidapi-key=${GoogleSearchApi.key}";

  static String getBingVideoSearch(String team) {
    return "https://api.bing.microsoft.com/v7.0/videos/search?q=$team";
  }

  static String sioTeam(String team) =>
      "$_sioBaseUrl/Players/$team?key=e26bf32a407a4c59bb1998de668ba83e";

  // nba data urls ////////////////////////////

  // Returns ALL nba games for the given year
  static String nbaFullSchedule(String year) =>
      "http://data.nba.net/10s/prod/v2/$year/schedule.json";

  // Returns all games for the specified TEAM in a given year
  static String nbaTeamSchedule(String teamId, String year) =>
      "http://data.nba.net/prod/v1/$year/teams/$teamId/schedule.json";

  // Returns a list of All teams
  static String nbaAllTeams() =>
      "http://data.nba.net/10s/prod/v2/2020/teams.json";

  // Returns basic data on a team
  static String nbaTeamProfile(String teamId) =>
      "https://www.nba.com/stats/feeds/teams/profile/${teamId}_TeamProfile.js";

  // Returns a list of ALL players in the league
  static String nbaAllPlayers() =>
      "http://data.nba.net/10s/prod/v1/2020/players.json";

  // Returns the team roster for the specified team
  static String nbaTeamRoster(String teamUrlCode) =>
      "http://data.nba.net/10s/prod/v1/2020/teams/$teamUrlCode/roster.json";

  // Returns team stats for all teams
  static String nbaTeamStats(String year) =>
      "http://data.nba.net/10s/prod/v1/$year/team_stats_rankings.json";

  // Returns team stat leaders for given team
  static String nbaTeamStatLeaders(String year, String team) =>
      "http://data.nba.net/10s/prod/v1/$year/teams/$team/leaders.json";

  // Returns player stats
  static String nbaPlayerStats(String season, String personId) =>
      "http://data.nba.net/prod/v1/$season/players/${personId}_profile.json";

  // Returns player transactions
  static String nbaPlayerMovement() =>
      "https://www.nba.com/stats/js/data/playermovement/NBA_Player_Movement.json";

  // Returns player bio
  static String nbaPlayerBio(String playerId) =>
      "http://data.nba.net/json/bios/player_$playerId.json";

  // Returns the box score for a specified game
  static String nbaBoxScore(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_boxscore.json";

  // Returns the game book for a specified game
  static String nbaGameBook(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_Book.pdf";

  // Returns the play by play for a game by period
  static String nbaPlayByPlay(String gameDate, String gameId, String period) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_pbp_$period.json";

  // Returns the preview article for a specified game
  static String nbaGamePreviewArticle(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_preview_article.json";

  static String nbaGameRecapArticle(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_recap_article.json";

  static String nbaConferenceStandings() =>
      "http://data.nba.net/10s/prod/v1/current/standings_conference.json";

  static String nbaDivisionStandings() =>
      "http://data.nba.net/10s//prod/v1/current/standings_division.json";

  static String nbaGamesToday() {
    DateTime today = new DateTime.now();
    String year = today.year.toString();
    String month = today.month.toString();
    String day = today.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }

  static String nbaGamesSelectedDate(String date) {
    return "http://data.nba.net/10s/prod/v1/$date/scoreboard.json";
  }

  static String nbaGamesDayMinusOne() {
    DateTime today = new DateTime.now();
    DateTime yesterday = today.subtract(new Duration(days: 1));
    String year = yesterday.year.toString();
    String month = yesterday.month.toString();
    String day = yesterday.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }

  static String nbaGamesDayMinusTwo() {
    DateTime today = new DateTime.now();
    DateTime prevDay = today.subtract(new Duration(days: 2));
    String year = prevDay.year.toString();
    String month = prevDay.month.toString();
    String day = prevDay.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }

  static String nbaGamesDayMinusThree() {
    DateTime today = new DateTime.now();
    DateTime prevDay = today.subtract(new Duration(days: 1));
    String year = prevDay.year.toString();
    String month = prevDay.month.toString();
    String day = prevDay.day.toString();

    return "http://data.nba.net/10s/prod/v1/${year + month + day}/scoreboard.json";
  }
}
