class GameBoxScoreFourFactors {
  String GAME_ID;
  String TEAM_ID;
  String TEAM_ABBREVIATION;
  String TEAM_CITY;
  String PLAYER_ID;
  String PLAYER_NAME;
  String START_POSITION;
  String COMMENT;
  String MIN;
  double EFG_PCT;
  double FTA_RATE;
  double TM_TOV_PCT;
  double OREB_PCT;
  double OPP_EFG_PCT;
  double OPP_FTA_RATE;
  double OPP_TM_TOV_PCT;
  double OPP_OREB_PCT;

  GameBoxScoreFourFactors(dynamic json) {
    GAME_ID = json[0];
    TEAM_ID = json[1].toString();
    TEAM_ABBREVIATION = json[2];
    TEAM_CITY = json[3];
    PLAYER_ID = json[4].toString();
    PLAYER_NAME = json[5];
    START_POSITION = json[6];
    COMMENT = json[7];
    MIN = json[8] == null ? "0" : json[8];
    EFG_PCT = json[9] == null ? 0.0 : json[9];
    FTA_RATE = json[10] == null ? 0.0 : json[10];
    TM_TOV_PCT = json[11] == null ? 0.0 : json[11];
    OREB_PCT = json[12] == null ? 0.0 : json[12];
    OPP_EFG_PCT = json[13] == null ? 0.0 : json[13];
    OPP_FTA_RATE = json[14] == null ? 0.0 : json[14];
    OPP_TM_TOV_PCT = json[15] == null ? 0.0 : json[15];
    OPP_OREB_PCT = json[16] == null ? 0.0 : json[16];
  }
}

class GameBoxScoreFourFactorsList {
  List<GameBoxScoreFourFactors> items = List<GameBoxScoreFourFactors>();

  GameBoxScoreFourFactorsList(dynamic json, String teamId) {
    for (var b in json) {
      if (b[1].toString() == teamId) {
        items.add(GameBoxScoreFourFactors(b));
      }
    }
  }

  // void sortByOffRtg(bool asc) {
  //   if (asc) {
  //     items.sort((a, b) {
  //       if (b.OFF_RATING < a.OFF_RATING)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   } else {
  //     items.sort((a, b) {
  //       if (b.OFF_RATING > a.OFF_RATING)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   }
  // }

  // void sortByDefRtg(bool asc) {
  //   if (asc) {
  //     items.sort((a, b) {
  //       if (b.DEF_RATING < a.DEF_RATING)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   } else {
  //     items.sort((a, b) {
  //       if (b.DEF_RATING > a.DEF_RATING)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   }
  // }
}
