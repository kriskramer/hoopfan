import 'package:hoop/services/apikey/key.dart'; // get your own nba-Api key

class Urls {
  static final String _apiBaseUrl = "https://api-nba-v1.p.rapidapi.com";
  static final String _teamBaseUrl = "https://www.nba.com/";
  static final String _sioBaseUrl =
      "https://api.sportsdata.io/v3/nba/stats/json/";

  static String eastStandingsUrl(String year) =>
      "$_apiBaseUrl/standings/standard/$year/conference/east/?rapidapi-key=${NbaApi.key}";
  static String westStandingsUrl(String year) =>
      "$_apiBaseUrl/standings/standard/$year/conference/west/?rapidapi-key=${NbaApi.key}";

  static String southwestDivisionStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/division/southwest/?rapidapi-key=${NbaApi.key}";
  static String atlanticDivisionStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/division/atlantic/?rapidapi-key=${NbaApi.key}";
  static String southeastDivisionStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/division/southeast/?rapidapi-key=${NbaApi.key}";
  static String pacificDivisionStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/division/pacific/?rapidapi-key=${NbaApi.key}";
  static String northwestDivisionStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/division/northwest/?rapidapi-key=${NbaApi.key}";
  static String centralDivisionStandingsUrl =
      "$_apiBaseUrl/standings/standard/2019/division/central/?rapidapi-key=${NbaApi.key}";

  static String seasonsUrl = "$_apiBaseUrl/seasons/?rapidapi-key=${NbaApi.key}";

  static String getDivisionStandings(String division, String year) {
    return "$_apiBaseUrl/standings/standard/${year}/division/${division}/?rapidapi-key=${NbaApi.key}";
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

  static String teamNews(String team) =>
      //"https://bing-news-search1.p.rapidapi.com/news/search?q=$team&freshness=Day&textFormat=Raw&safeSearch=Off?rapidapi-key=${NbaApi.key}";
      "https://google-search-data.p.rapidapi.com/search/news?items=35&query=$team&language=en&start=0&rapidapi-key=${NbaApi.key}";

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

  // Returns a list of ALL players in the league
  static String nbaAllPlayers() =>
      "http://data.nba.net/10s/prod/v1/2020/players.json";

  // Returns the team roster for the specified team
  static String nbaTeamRoster(String teamUrlCode) =>
      "http://data.nba.net/10s/prod/v1/2020/teams/$teamUrlCode/roster.json";

  // Returns the box score for a specified game
  static String nbaBoxScore(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_boxscore.json";

  // Returns the game book for a specified game
  static String nbaGameBook(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_Book.pdf";

  // Returns the play by play for a game by period
  static String nbaPlayByPlay(
          String gameDate, String gameId, String periodNum, String period) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_pbp_$period.json";

  // Returns the preview article for a specified game
  static String nbaGamePreviewArticle(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_preview_article.json";

  static String nbaGameRecapArticle(String gameDate, String gameId) =>
      "http://data.nba.net/prod/v1/$gameDate/${gameId}_recap_article.json";
}
