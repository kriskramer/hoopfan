class GameBoxScoreAdvanced {
  String gameId;
  String teamId;
  String teamAbbreviation;
  String teamCity;
  String playerId;
  String playerName;
  String startPosition;
  String comment;
  String MIN;
  double eOffRating;
  double offRating;
  double eDefRating;
  double defRating;
  double eNetRating;
  double netRating;
  double astPct;
  double astTov;
  double astRatio;
  double oRebPct;
  double dRebPct;
  double rebPct;
  double tmTovPct;
  double eFgPct;
  double tsPct;
  double usgPct;
  double eUsgPct;
  double ePace;
  double PACE;
  double pacePer40;
  int POSS;
  double PIE;

  GameBoxScoreAdvanced(dynamic json) {
    gameId = json[0];
    teamId = json[1].toString();
    teamAbbreviation = json[2];
    teamCity = json[3];
    playerId = json[4].toString();
    playerName = json[5];
    startPosition = json[7];
    comment = json[8];
    MIN = json[9] == null ? "0" : json[9];
    eOffRating = json[10] == null ? 0.0 : json[10];
    offRating = json[11] == null ? 0.0 : json[11];
    eDefRating = json[12] == null ? 0.0 : json[12];
    defRating = json[13] == null ? 0.0 : json[13];
    eNetRating = json[14] == null ? 0.0 : json[14];
    netRating = json[15] == null ? 0.0 : json[15];
    astPct = json[16] == null ? 0.0 : json[16];
    astTov = json[17] == null ? 0.0 : json[17];
    astRatio = json[18] == null ? 0.0 : json[18];
    oRebPct = json[19] == null ? 0.0 : json[19];
    dRebPct = json[20] == null ? 0.0 : json[20];
    rebPct = json[21] == null ? 0.0 : json[21];
    tmTovPct = json[22] == null ? 0.0 : json[22];
    eFgPct = json[23] == null ? 0.0 : json[23];
    tsPct = json[24] == null ? 0.0 : json[24];
    usgPct = json[25] == null ? 0.0 : json[25];
    eUsgPct = json[26] == null ? 0.0 : json[26];
    ePace = json[27] == null ? 0.0 : json[27];
    PACE = json[28] == null ? 0.0 : json[28];
    pacePer40 = json[29] == null ? 0.0 : json[29];
    POSS = json[30] == null ? 0 : json[30];
    PIE = json[31] == null ? 0.0 : json[31];
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
        if (b.offRating < a.offRating)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.offRating > a.offRating)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortByDefRtg(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.defRating < a.defRating)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.defRating > a.defRating)
          return 1;
        else
          return -1;
      });
    }
  }
}
