class AdvancedStatsLeague {
  var TEAMID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var eOffRating;
  var offRating;
  var eDefRating;
  var defRating;
  var eNetRating;
  var netRating;
  var astPct;
  var AST_TO;
  var astRatio;
  var oRebPct;
  var dRebPct;
  var rebPct;
  var tmTovPct;
  var eFgPct;
  var tsPct;
  var ePace;
  var PACE;
  var pacePer40;
  var POSS;
  var PIE;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var offRating_RANK;
  var defRating_RANK;
  var netRating_RANK;
  var astPct_RANK;
  var AST_TO_RANK;
  var astRatio_RANK;
  var oRebPct_RANK;
  var dRebPct_RANK;
  var rebPct_RANK;
  var tmTovPct_RANK;
  var eFgPct_RANK;
  var tsPct_RANK;
  var PACE_RANK;
  var PIE_RANK;
  var CFID;
  var CFPARAMS;

  AdvancedStatsLeague(dynamic json) {
    TEAMID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    eOffRating = json[7];
    offRating = json[8];
    eDefRating = json[9];
    defRating = json[10];
    eNetRating = json[11];
    netRating = json[12];
    astPct = json[13];
    AST_TO = json[14];
    astRatio = json[15];
    oRebPct = json[16];
    dRebPct = json[17];
    rebPct = json[18];
    tmTovPct = json[19];
    eFgPct = json[20];
    tsPct = json[21];
    ePace = json[22];
    PACE = json[23];
    pacePer40 = json[24];
    POSS = json[25];
    PIE = json[26];
    GP_RANK = json[27];
    W_RANK = json[28];
    L_RANK = json[29];
    W_PCT_RANK = json[30];
    MIN_RANK = json[31];
    offRating_RANK = json[32];
    defRating_RANK = json[33];
    netRating_RANK = json[34];
    astPct_RANK = json[35];
    AST_TO_RANK = json[36];
    astRatio_RANK = json[37];
    oRebPct_RANK = json[38];
    dRebPct_RANK = json[39];
    rebPct_RANK = json[40];
    tmTovPct_RANK = json[41];
    eFgPct_RANK = json[42];
    tsPct_RANK = json[43];
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
      if (b.offRating_RANK == 1) {
        return (b.offRating).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomORtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.offRating_RANK == 30) {
        return (b.offRating).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgORtg() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.offRating;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopDRtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.defRating_RANK == 1) {
        return (b.defRating).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomDRtg() {
    for (AdvancedStatsLeague b in items) {
      if (b.defRating_RANK == 30) {
        return (b.defRating).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgDRtg() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.defRating;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopTSPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.tsPct_RANK == 1) {
        return (b.tsPct).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomTSPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.tsPct_RANK == 30) {
        return (b.tsPct).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgTSPct() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.tsPct;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopEFgPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.eFgPct_RANK == 1) {
        return (b.eFgPct).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomEFgPct() {
    for (AdvancedStatsLeague b in items) {
      if (b.eFgPct_RANK == 30) {
        return (b.eFgPct).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgEFgPct() {
    var total = 0.0;
    for (AdvancedStatsLeague b in items) {
      total += b.eFgPct;
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
        if (b.offRating > a.offRating)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.offRating > b.offRating)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortDRTG(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.defRating > a.defRating)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.defRating > b.defRating)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortNET(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.netRating > a.netRating)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.netRating > b.netRating)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortASTPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.astPct > a.astPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.astPct > b.astPct)
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
        if (b.astRatio > a.astRatio)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.astRatio > b.astRatio)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOREBPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.oRebPct > a.oRebPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.oRebPct > b.oRebPct)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortDREBPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.dRebPct > a.dRebPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.dRebPct > b.dRebPct)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortREBPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.rebPct > a.rebPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.rebPct > b.rebPct)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortTMTOVPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.tmTovPct > a.tmTovPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.tmTovPct > b.tmTovPct)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortEFG(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.eFgPct > a.eFgPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.eFgPct > b.eFgPct)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortTS(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.tsPct > a.tsPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.tsPct > b.tsPct)
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
        if (b.pacePer40 > a.pacePer40)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.pacePer40 > b.pacePer40)
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
