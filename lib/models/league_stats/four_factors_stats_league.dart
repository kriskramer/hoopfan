class FourFactorsStatsLeague {
  var TEAMID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var eFgPct;
  var FTA_RATE;
  var tmTovPct;
  var oRebPct;
  var OPP_eFgPct;
  var OPP_FTA_RATE;
  var OPP_TOV_PCT;
  var OPP_oRebPct;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var eFgPct_RANK;
  var FTA_RATE_RANK;
  var tmTovPct_RANK;
  var oRebPct_RANK;
  var OPP_eFgPct_RANK;
  var OPP_FTA_RATE_RANK;
  var OPP_TOV_PCT_RANK;
  var OPP_oRebPct_RANK;
  var CFID;
  var CFPARAMS;

  FourFactorsStatsLeague(dynamic json) {
    TEAMID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    eFgPct = json[7];
    FTA_RATE = json[8];
    tmTovPct = json[9];
    oRebPct = json[10];
    OPP_eFgPct = json[11];
    OPP_FTA_RATE = json[12];
    OPP_TOV_PCT = json[13];
    OPP_oRebPct = json[14];
    GP_RANK = json[15];
    W_RANK = json[16];
    L_RANK = json[17];
    W_PCT_RANK = json[18];
    MIN_RANK = json[19];
    eFgPct_RANK = json[20];
    FTA_RATE_RANK = json[21];
    tmTovPct_RANK = json[22];
    oRebPct_RANK = json[23];
    OPP_eFgPct_RANK = json[24];
    OPP_FTA_RATE_RANK = json[25];
    OPP_TOV_PCT_RANK = json[26];
    OPP_oRebPct_RANK = json[27];
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

  void sortORebPct(bool asc) {
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

  void sortOppEFGPct(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_eFgPct > a.OPP_eFgPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_eFgPct > b.OPP_eFgPct)
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
        if (b.OPP_oRebPct > a.OPP_oRebPct)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_oRebPct > b.OPP_oRebPct)
          return 1;
        else
          return -1;
      });
    }
  }
}
