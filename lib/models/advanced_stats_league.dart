class AdvancedStatsLeague {
  var TEAM_ID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var E_OFF_RATING;
  var OFF_RATING;
  var E_DEF_RATING;
  var DEF_RATING;
  var E_NET_RATING;
  var NET_RATING;
  var AST_PCT;
  var AST_TO;
  var AST_RATIO;
  var OREB_PCT;
  var DREB_PCT;
  var REB_PCT;
  var TM_TOV_PCT;
  var EFG_PCT;
  var TS_PCT;
  var E_PACE;
  var PACE;
  var PACE_PER40;
  var POSS;
  var PIE;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var OFF_RATING_RANK;
  var DEF_RATING_RANK;
  var NET_RATING_RANK;
  var AST_PCT_RANK;
  var AST_TO_RANK;
  var AST_RATIO_RANK;
  var OREB_PCT_RANK;
  var DREB_PCT_RANK;
  var REB_PCT_RANK;
  var TM_TOV_PCT_RANK;
  var EFG_PCT_RANK;
  var TS_PCT_RANK;
  var PACE_RANK;
  var PIE_RANK;
  var CFID;
  var CFPARAMS;

  AdvancedStatsLeague(dynamic json) {
    TEAM_ID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    E_OFF_RATING = json[7];
    OFF_RATING = json[8];
    E_DEF_RATING = json[9];
    DEF_RATING = json[10];
    E_NET_RATING = json[11];
    NET_RATING = json[12];
    AST_PCT = json[13];
    AST_TO = json[14];
    AST_RATIO = json[15];
    OREB_PCT = json[16];
    DREB_PCT = json[17];
    REB_PCT = json[18];
    TM_TOV_PCT = json[19];
    EFG_PCT = json[20];
    TS_PCT = json[21];
    E_PACE = json[22];
    PACE = json[23];
    PACE_PER40 = json[24];
    POSS = json[25];
    PIE = json[26];
    GP_RANK = json[27];
    W_RANK = json[28];
    L_RANK = json[29];
    W_PCT_RANK = json[30];
    MIN_RANK = json[31];
    OFF_RATING_RANK = json[32];
    DEF_RATING_RANK = json[33];
    NET_RATING_RANK = json[34];
    AST_PCT_RANK = json[35];
    AST_TO_RANK = json[36];
    AST_RATIO_RANK = json[37];
    OREB_PCT_RANK = json[38];
    DREB_PCT_RANK = json[39];
    REB_PCT_RANK = json[40];
    TM_TOV_PCT_RANK = json[41];
    EFG_PCT_RANK = json[42];
    TS_PCT_RANK = json[43];
    PACE_RANK = json[44];
    PIE_RANK = json[45];
    CFID = json[46];
    CFPARAMS = json[47];
  }
}

class AdvancedStatsLeagueList {
  List<AdvancedStatsLeague> items = [];

  AdvancedStatsLeagueList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(AdvancedStatsLeague(s));
    }
  }

  String getTopORtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.OFF_RATING_RANK == 1) {
        return (b.OFF_RATING).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomORtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.OFF_RATING_RANK == 30) {
        return (b.OFF_RATING).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgORtg() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.OFF_RATING;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopDRtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.DEF_RATING_RANK == 1) {
        return (b.DEF_RATING).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomDRtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.DEF_RATING_RANK == 30) {
        return (b.DEF_RATING).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgDRtg() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.DEF_RATING;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopTSPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.TS_PCT_RANK == 1) {
        return (b.TS_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomTSPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.TS_PCT_RANK == 30) {
        return (b.TS_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgTSPct() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.TS_PCT;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopEFgPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.EFG_PCT_RANK == 1) {
        return (b.EFG_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomEFgPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.EFG_PCT_RANK == 30) {
        return (b.EFG_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgEFgPct() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.EFG_PCT;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopPace() {
    for (AdvancedStatsLeague b in items) {
      if (b.PACE_RANK == 1) {
        return b.PACE.toString();
      }
    }
    return "";
  }

  String getBottomPace() {
    for (AdvancedStatsLeague b in items) {
      if (b.PACE_RANK == 30) {
        return b.PACE.toString();
      }
    }
    return "";
  }

  String getAvgPace() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.PACE;
    }

    return (total / 30).toStringAsFixed(2);
  }
}
