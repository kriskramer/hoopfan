class GameBoxScoreAdvanced {
  String GAME_ID;
  String TEAM_ID;
  String TEAM_ABBREVIATION;
  String TEAM_CITY;
  String PLAYER_ID;
  String PLAYER_NAME;
  String START_POSITION;
  String COMMENT;
  String MIN;
  double E_OFF_RATING;
  double OFF_RATING;
  double E_DEF_RATING;
  double DEF_RATING;
  double E_NET_RATING;
  double NET_RATING;
  double AST_PCT;
  double AST_TOV;
  double AST_RATIO;
  double OREB_PCT;
  double DREB_PCT;
  double REB_PCT;
  double TM_TOV_PCT;
  double EFG_PCT;
  double TS_PCT;
  double USG_PCT;
  double E_USG_PCT;
  double E_PACE;
  double PACE;
  double PACE_PER40;
  int POSS;
  double PIE;

  GameBoxScoreAdvanced(dynamic json) {
    GAME_ID = json[0];
    TEAM_ID = json[1].toString();
    TEAM_ABBREVIATION = json[2];
    TEAM_CITY = json[3];
    PLAYER_ID = json[4].toString();
    PLAYER_NAME = json[5];
    START_POSITION = json[6];
    COMMENT = json[7];
    MIN = json[8] == null ? "0" : json[8];
    E_OFF_RATING = json[9] == null ? 0.0 : json[9];
    OFF_RATING = json[10] == null ? 0.0 : json[10];
    E_DEF_RATING = json[11] == null ? 0.0 : json[11];
    DEF_RATING = json[12] == null ? 0.0 : json[12];
    E_NET_RATING = json[13] == null ? 0.0 : json[13];
    NET_RATING = json[14] == null ? 0.0 : json[14];
    AST_PCT = json[15] == null ? 0.0 : json[15];
    AST_TOV = json[16] == null ? 0.0 : json[16];
    AST_RATIO = json[17] == null ? 0.0 : json[17];
    OREB_PCT = json[18] == null ? 0.0 : json[18];
    DREB_PCT = json[19] == null ? 0.0 : json[19];
    REB_PCT = json[20] == null ? 0.0 : json[20];
    TM_TOV_PCT = json[21] == null ? 0.0 : json[21];
    EFG_PCT = json[22] == null ? 0.0 : json[22];
    TS_PCT = json[23] == null ? 0.0 : json[23];
    USG_PCT = json[24] == null ? 0.0 : json[24];
    E_USG_PCT = json[25] == null ? 0.0 : json[25];
    E_PACE = json[26] == null ? 0.0 : json[26];
    PACE = json[27] == null ? 0.0 : json[27];
    PACE_PER40 = json[28] == null ? 0.0 : json[28];
    POSS = json[29] == null ? 0 : json[29];
    PIE = json[30] == null ? 0.0 : json[30];
  }
}

class GameBoxScoreAdvancedList {
  List<GameBoxScoreAdvanced> items = List<GameBoxScoreAdvanced>();

  GameBoxScoreAdvancedList(dynamic json, String teamId) {
    for (var b in json) {
      if (b[1].toString() == teamId) {
        items.add(GameBoxScoreAdvanced(b));
      }
    }
  }

  void sortByOffRtg(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OFF_RATING < a.OFF_RATING)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.OFF_RATING > a.OFF_RATING)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortByDefRtg(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.DEF_RATING < a.DEF_RATING)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.DEF_RATING > a.DEF_RATING)
          return 1;
        else
          return -1;
      });
    }
  }
}
