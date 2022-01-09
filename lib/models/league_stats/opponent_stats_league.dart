class OpponentStatsLeague {
  var TEAM_ID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var FGM;
  var FGA;
  var FG_PCT;
  var FG3M;
  var FG3A;
  var FG3_PCT;
  var FTM;
  var FTA;
  var FT_PCT;
  var OREB;
  var DREB;
  var REB;
  var AST;
  var TOV;
  var STL;
  var BLK;
  var BLKA;
  var PF;
  var PFD;
  var PTS;
  var PLUS_MINUS;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var FGM_RANK;
  var FGA_RANK;
  var FG_PCT_RANK;
  var FG3M_RANK;
  var FG3A_RANK;
  var FG3_PCT_RANK;
  var FTM_RANK;
  var FTA_RANK;
  var FT_PCT_RANK;
  var OREB_RANK;
  var DREB_RANK;
  var REB_RANK;
  var AST_RANK;
  var TOV_RANK;
  var STL_RANK;
  var BLK_RANK;
  var BLKA_RANK;
  var PF_RANK;
  var PFD_RANK;
  var PTS_RANK;
  var PLUS_MINUS_RANK;

  OpponentStatsLeague(dynamic json) {
    TEAM_ID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    FGM = json[7];
    FGA = json[8];
    FG_PCT = json[9];
    FG3M = json[10];
    FG3A = json[11];
    FG3_PCT = json[12];
    FTM = json[13];
    FTA = json[14];
    FT_PCT = json[15];
    OREB = json[16];
    DREB = json[17];
    REB = json[18];
    AST = json[19];
    TOV = json[20];
    STL = json[21];
    BLK = json[22];
    BLKA = json[23];
    PF = json[24];
    PFD = json[25];
    PTS = json[26];
    PLUS_MINUS = json[27];
    GP_RANK = json[28];
    W_RANK = json[29];
    L_RANK = json[30];
    W_PCT_RANK = json[31];
    MIN_RANK = json[32];
    FGM_RANK = json[33];
    FGA_RANK = json[34];
    FG_PCT_RANK = json[35];
    FG3M_RANK = json[36];
    FG3A_RANK = json[37];
    FG3_PCT_RANK = json[38];
    FTM_RANK = json[39];
    FTA_RANK = json[40];
    FT_PCT_RANK = json[41];
    OREB_RANK = json[42];
    DREB_RANK = json[43];
    REB_RANK = json[44];
    AST_RANK = json[45];
    TOV_RANK = json[46];
    STL_RANK = json[47];
    BLK_RANK = json[48];
    BLKA_RANK = json[49];
    PF_RANK = json[50];
    PFD_RANK = json[51];
    PTS_RANK = json[52];
    PLUS_MINUS_RANK = json[53];
  }
}

class OpponentStatsLeagueList {
  List<OpponentStatsLeague> items = [];

  OpponentStatsLeagueList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(OpponentStatsLeague(s));
    }
  }

  String getTopPoints() {
    for (OpponentStatsLeague b in items) {
      if (b.PTS_RANK == 1) {
        return (b.PTS / b.GP).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomPoints() {
    for (OpponentStatsLeague b in items) {
      if (b.PTS_RANK == 30) {
        return (b.PTS / b.GP).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgPoints() {
    var total = 0.0;
    for (OpponentStatsLeague b in items) {
      total += b.PTS / b.GP;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopFGPct() {
    for (OpponentStatsLeague b in items) {
      if (b.FG_PCT_RANK == 1) {
        return (b.FG_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomFGPct() {
    for (OpponentStatsLeague b in items) {
      if (b.FG_PCT_RANK == 30) {
        return (b.FG_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgFGPct() {
    var total = 0.0;
    for (OpponentStatsLeague b in items) {
      total += b.FG_PCT;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTop3PPct() {
    for (OpponentStatsLeague b in items) {
      if (b.FG3_PCT_RANK == 1) {
        return (b.FG3_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottom3PPct() {
    for (OpponentStatsLeague b in items) {
      if (b.FG3_PCT_RANK == 30) {
        return (b.FG3_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvg3PPct() {
    var total = 0.0;
    for (OpponentStatsLeague b in items) {
      total += b.FG3_PCT;
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

  void sortFGM(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FGM > a.FGM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FGM > b.FGM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFGA(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FGA > a.FGA)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FGA > b.FGA)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFGPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FG_PCT > a.FG_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FG_PCT > b.FG_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFG3M(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FG3M > a.FG3M)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FG3M > b.FG3M)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFG3A(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FG3A > a.FG3A)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FG3A > b.FG3A)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFG3PCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FG3_PCT > a.FG3_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FG3_PCT > b.FG3_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFTM(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FTM > a.FTM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FTM > b.FTM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFTA(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FTA > a.FTA)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FTA > b.FTA)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortFTPCT(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.FT_PCT > a.FT_PCT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.FT_PCT > b.FT_PCT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortOREB(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.OREB > a.OREB)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.OREB > b.OREB)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortDREB(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.DREB > a.DREB)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.DREB > b.DREB)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortREB(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.REB > a.REB)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.REB > b.REB)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortAST(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.AST > a.AST)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.AST > b.AST)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortTOV(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.TOV > a.TOV)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.TOV > b.TOV)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortSTL(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.STL > a.STL)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.STL > b.STL)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortBLK(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.BLK > a.BLK)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.BLK > b.BLK)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortBLKA(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.BLKA > a.BLKA)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.BLKA > b.BLKA)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPF(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PF > a.PF)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PF > b.PF)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPFD(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PFD > a.PFD)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PFD > b.PFD)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPTS(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PTS > a.PTS)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PTS > b.PTS)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPLUSMINUS(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PLUS_MINUS > a.PLUS_MINUS)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PLUS_MINUS > b.PLUS_MINUS)
          return 1;
        else
          return -1;
      });
    }
  }
}
