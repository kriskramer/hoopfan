class MiscStatsLeague {
  var TEAM_ID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var PTS_OFF_TOV;
  var PTS_2ND_CHANCE;
  var PTS_FB;
  var PTS_PAINT;
  var OPP_PTS_OFF_TOV;
  var OPP_PTS_2ND_CHANCE;
  var OPP_PTS_FB;
  var OPP_PTS_PAINT;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var PTS_OFF_TOV_RANK;
  var PTS_2ND_CHANCE_RANK;
  var PTS_FB_RANK;
  var PTS_PAINT_RANK;
  var OPP_PTS_OFF_TOV_RANK;
  var OPP_PTS_2ND_CHANCE_RANK;
  var OPP_PTS_FB_RANK;
  var OPP_PTS_PAINT_RANK;
  var CFID;
  var CFPARAMS;

  MiscStatsLeague(dynamic json) {
    TEAM_ID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    PTS_OFF_TOV = json[7];
    PTS_2ND_CHANCE = json[8];
    PTS_FB = json[9];
    PTS_PAINT = json[10];
    OPP_PTS_OFF_TOV = json[11];
    OPP_PTS_2ND_CHANCE = json[12];
    OPP_PTS_FB = json[13];
    OPP_PTS_PAINT = json[14];
    GP_RANK = json[15];
    W_RANK = json[16];
    L_RANK = json[17];
    W_PCT_RANK = json[18];
    MIN_RANK = json[19];
    PTS_OFF_TOV_RANK = json[20];
    PTS_2ND_CHANCE_RANK = json[21];
    PTS_FB_RANK = json[22];
    PTS_PAINT_RANK = json[23];
    OPP_PTS_OFF_TOV_RANK = json[24];
    OPP_PTS_2ND_CHANCE_RANK = json[25];
    OPP_PTS_FB_RANK = json[26];
    OPP_PTS_PAINT_RANK = json[27];
    CFID = json[28];
    CFPARAMS = json[29];
  }
}

class MiscStatsLeagueList {
  List<MiscStatsLeague> items = [];

  MiscStatsLeagueList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(MiscStatsLeague(s));
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

  void sortPtsOffTov(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PTS_OFF_TOV > a.PTS_OFF_TOV)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PTS_OFF_TOV > b.PTS_OFF_TOV)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPts2ndChance(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PTS_2ND_CHANCE > a.PTS_2ND_CHANCE)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PTS_2ND_CHANCE > b.PTS_2ND_CHANCE)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPtsFb(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PTS_FB > a.PTS_FB)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PTS_FB > b.PTS_FB)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPtsPaint(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PTS_PAINT > a.PTS_PAINT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PTS_PAINT > b.PTS_PAINT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppPtsOffTov(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_PTS_OFF_TOV > a.OPP_PTS_OFF_TOV)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_PTS_OFF_TOV > b.OPP_PTS_OFF_TOV)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppPts2ndChance(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_PTS_2ND_CHANCE > a.OPP_PTS_2ND_CHANCE)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_PTS_2ND_CHANCE > b.OPP_PTS_2ND_CHANCE)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppPtsFb(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_PTS_FB > a.OPP_PTS_FB)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_PTS_FB > b.OPP_PTS_FB)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOppPtsPaint(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OPP_PTS_PAINT > a.OPP_PTS_PAINT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OPP_PTS_PAINT > b.OPP_PTS_PAINT)
          return 1;
        else
          return -1;
      });
    }
  }
}
