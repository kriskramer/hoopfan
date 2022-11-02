class GameBoxScoreDefense {
  String gameId;
  String TEAMID;
  String teamAbbreviation;
  String teamCity;
  String TEAM_NICKNAME;
  String playerId;
  String playerName;
  String startPosition;
  String comment;
  String MATCHUP_MIN;
  double PARTIAL_POSS;
  int SWITCHES_ON;
  int PLAYER_PTS;
  int DREB;
  int MATCHUP_AST;
  int MATCHUP_TOV;
  int STL;
  int BLK;
  int MATCHUP_FGM;
  int MATCHUP_FGA;
  double MATCHUP_FG_PCT;
  int MATCHUP_FG3M;
  int MATCHUP_FG3A;
  double MATCHUP_FG3_PCT;

  GameBoxScoreDefense(dynamic json) {
    gameId = json[0];
    TEAMID = json[1].toString();
    teamAbbreviation = json[2];
    teamCity = json[3];
    TEAM_NICKNAME = json[4];
    playerId = json[5].toString();
    playerName = json[6];
    startPosition = json[7];
    comment = json[8];
    MATCHUP_MIN = json[9] == null ? "0" : json[9];
    PARTIAL_POSS = json[10] == null ? 0.0 : json[10];
    SWITCHES_ON = json[11] == null ? 0 : json[11];
    PLAYER_PTS = json[12] == null ? 0 : json[12];
    DREB = json[13] == null ? 0 : json[13];
    MATCHUP_AST = json[14] == null ? 0 : json[14];
    MATCHUP_TOV = json[15] == null ? 0 : json[15];
    STL = json[16] == null ? 0 : json[16];
    BLK = json[17] == null ? 0 : json[17];
    MATCHUP_FGM = json[18] == null ? 0 : json[18];
    MATCHUP_FGA = json[19] == null ? 0 : json[19];
    MATCHUP_FG_PCT = json[20] == null ? 0.0 : json[20];
    MATCHUP_FG3M = json[21] == null ? 0 : json[21];
    MATCHUP_FG3A = json[22] == null ? 0 : json[22];
    MATCHUP_FG3_PCT = json[23] == null ? 0.0 : json[23];
  }
}

class GameBoxScoreDefenseList {
  List<GameBoxScoreDefense> items = List<GameBoxScoreDefense>();

  GameBoxScoreDefenseList(dynamic json, String teamId) {
    for (var b in json) {
      if (b[1].toString() == teamId) {
        items.add(GameBoxScoreDefense(b));
      }
    }
  }

  void sortByPartialPoss(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PARTIAL_POSS < a.PARTIAL_POSS)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.PARTIAL_POSS > a.PARTIAL_POSS)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortBySwitchesOn(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.SWITCHES_ON < a.SWITCHES_ON)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.SWITCHES_ON > a.SWITCHES_ON)
          return 1;
        else
          return -1;
      });
    }
  }
}
