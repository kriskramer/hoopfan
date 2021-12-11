// refactor network request Headers into this class
class RequestHeaders {
  static Map<String, String> bingHeaders = {
    'Ocp-Apim-Subscription-Key': "" //"235ced56b4ba4206a1e59e1785657176"
  };
  static Map<String, String> twitterStreamHeaders = {
    'Authorization':
        "Bearer AAAAAAAAAAAAAAAAAAAAAIr4KgEAAAAAAeA5QVwDwCoTwQTtUcLBEWkQkBU%3DuY8dkZF6DUxj63dxoszJwBlc4Awaud863H4xPeznECZvSoxTsm",
  };
  static Map<String, String> nbaStatsHeaders = {
    'Host': 'stats.nba.com',
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0',
    'Accept': 'application/json, text/plain, */*',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate, br',
    'x-nba-stats-origin': 'stats',
    'x-nba-stats-token': 'true',
    'Connection': 'keep-alive',
    'Referer': 'https://stats.nba.com/',
    'Pragma': 'no-cache',
    'Cache-Control': 'no-cache',
  };

  static Map<String, String> freeNewsHeaders = {
    "x-rapidapi-host": "free-news.p.rapidapi.com",
    "x-rapidapi-key": "5b26dde365mshcec96152e331e05p1ab7c8jsn6d180eadd5fb",
  };
}
