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

  void sortTeam(bool asc) {
    if (asc) {
      items.sort((a, b) {
        return b.TEAM_NAME.toString().compareTo(a.TEAM_NAME.toString());
      });
    } else {
      items.sort((a, b) {
        return a.TEAM_NAME.toString().compareTo(b.TEAM_NAME.toString());
      });
    }
  }

  void sortGP(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.GP > a.GP)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.GP > b.GP)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortW(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.W > a.W)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.W > b.W)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortL(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.L > a.L)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.L > b.L)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortWPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.W_PCT > a.W_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.W_PCT > b.W_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortMin(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.MIN > a.MIN)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.MIN > b.MIN)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortORTG(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OFF_RATING > a.OFF_RATING)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OFF_RATING > b.OFF_RATING)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortDRTG(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.DEF_RATING > a.DEF_RATING)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.DEF_RATING > b.DEF_RATING)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortNET(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.NET_RATING > a.NET_RATING)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.NET_RATING > b.NET_RATING)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortASTPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.AST_PCT > a.AST_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.AST_PCT > b.AST_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortASTTOV(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.AST_TO > a.AST_TO)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.AST_TO > b.AST_TO)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortASTRATIO(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.AST_RATIO > a.AST_RATIO)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.AST_RATIO > b.AST_RATIO)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOREBPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OREB_PCT > a.OREB_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OREB_PCT > b.OREB_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortDREBPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.DREB_PCT > a.DREB_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.DREB_PCT > b.DREB_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortREBPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.REB_PCT > a.REB_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.REB_PCT > b.REB_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortTMTOVPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.TM_TOV_PCT > a.TM_TOV_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.TM_TOV_PCT > b.TM_TOV_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortEFG(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.EFG_PCT > a.EFG_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.EFG_PCT > b.EFG_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortTS(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.TS_PCT > a.TS_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.TS_PCT > b.TS_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPACE(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PACE > a.PACE)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PACE > b.PACE)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPACE40(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PACE_PER40 > a.PACE_PER40)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PACE_PER40 > b.PACE_PER40)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPOSS(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.POSS > a.POSS)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.POSS > b.POSS)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPIE(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PIE > a.PIE)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PIE > b.PIE)
          return 1;
        else
          return -1;
      });
    }
  }
}
