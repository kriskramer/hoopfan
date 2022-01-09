class FourFactorsStatsLeague {
  var TEAM_ID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var EFG_PCT;
  var FTA_RATE;
  var TM_TOV_PCT;
  var OREB_PCT;
  var OPP_EFG_PCT;
  var OPP_FTA_RATE;
  var OPP_TOV_PCT;
  var OPP_OREB_PCT;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var EFG_PCT_RANK;
  var FTA_RATE_RANK;
  var TM_TOV_PCT_RANK;
  var OREB_PCT_RANK;
  var OPP_EFG_PCT_RANK;
  var OPP_FTA_RATE_RANK;
  var OPP_TOV_PCT_RANK;
  var OPP_OREB_PCT_RANK;
  var CFID;
  var CFPARAMS;

  FourFactorsStatsLeague(dynamic json) {
    TEAM_ID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    EFG_PCT = json[7];
    FTA_RATE = json[8];
    TM_TOV_PCT = json[9];
    OREB_PCT = json[10];
    OPP_EFG_PCT = json[11];
    OPP_FTA_RATE = json[12];
    OPP_TOV_PCT = json[13];
    OPP_OREB_PCT = json[14];
    GP_RANK = json[15];
    W_RANK = json[16];
    L_RANK = json[17];
    W_PCT_RANK = json[18];
    MIN_RANK = json[19];
    EFG_PCT_RANK = json[20];
    FTA_RATE_RANK = json[21];
    TM_TOV_PCT_RANK = json[22];
    OREB_PCT_RANK = json[23];
    OPP_EFG_PCT_RANK = json[24];
    OPP_FTA_RATE_RANK = json[25];
    OPP_TOV_PCT_RANK = json[26];
    OPP_OREB_PCT_RANK = json[27];
    CFID = json[28];
    CFPARAMS = json[29];
  }
}

class FourFactorsStatsLeagueList {
  List<FourFactorsStatsLeague> items = [];

  FourFactorsStatsLeagueList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(FourFactorsStatsLeague(s));
    }
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

  void sortEFGPct(bool asc) {
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

  void sortFTARate(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FTA_RATE > a.FTA_RATE)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FTA_RATE > b.FTA_RATE)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortTmTovPct(bool asc) {
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

  void sortORebPct(bool asc) {
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

  void sortOppEFGPct(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_EFG_PCT > a.OPP_EFG_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_EFG_PCT > b.OPP_EFG_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppFtaRate(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_FTA_RATE > a.OPP_FTA_RATE)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_FTA_RATE > b.OPP_FTA_RATE)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppTovPct(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_TOV_PCT > a.OPP_TOV_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_TOV_PCT > b.OPP_TOV_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppORebPct(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_OREB_PCT > a.OPP_OREB_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_OREB_PCT > b.OPP_OREB_PCT)
          return 1;
        else
          return -1;
      });
    }
  }
}
