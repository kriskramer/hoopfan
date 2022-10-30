class GameBoxScoreFourFactors {
  String gameId;
  String TEAMID;
  String teamAbbreviation;
  String teamCity;
  String playerId;
  String playerName;
  String startPosition;
  String comment;
  String MIN;
  double eFgPct;
  double FTA_RATE;
  double tmTovPct;
  double oRebPct;
  double OPP_eFgPct;
  double OPP_FTA_RATE;
  double OPP_tmTovPct;
  double OPP_oRebPct;

  GameBoxScoreFourFactors(dynamic json) {
    gameId = json[0];
    TEAMID = json[1].toString();
    teamAbbreviation = json[2];
    teamCity = json[3];
    playerId = json[4].toString();
    playerName = json[5];
    startPosition = json[7];
    comment = json[8];
    MIN = json[9] == null ? "0" : json[9];
    eFgPct = json[10] == null ? 0.0 : json[10];
    FTA_RATE = json[11] == null ? 0.0 : json[11];
    tmTovPct = json[12] == null ? 0.0 : json[12];
    oRebPct = json[13] == null ? 0.0 : json[13];
    OPP_eFgPct = json[14] == null ? 0.0 : json[14];
    OPP_FTA_RATE = json[15] == null ? 0.0 : json[15];
    OPP_tmTovPct = json[16] == null ? 0.0 : json[16];
    OPP_oRebPct = json[17] == null ? 0.0 : json[17];
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
  //       if (b.offRating < a.offRating)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   } else {
  //     items.sort((a, b) {
  //       if (b.offRating > a.offRating)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   }
  // }

  // void sortByDefRtg(bool asc) {
  //   if (asc) {
  //     items.sort((a, b) {
  //       if (b.defRating < a.defRating)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   } else {
  //     items.sort((a, b) {
  //       if (b.defRating > a.defRating)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   }
  // }
}
