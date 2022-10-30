class ScoringStatsLeague {
  var TEAMID;
  var TEAM_NAME;
  var GP;
  var W;
  var L;
  var W_PCT;
  var MIN;
  var PCT_FGA_2PT;
  var PCT_FGA_3PT;
  var PCT_PTS_2PT;
  var PCT_PTS_2PT_MR;
  var PCT_PTS_3PT;
  var PCT_PTS_FB;
  var PCT_PTS_FT;
  var PCT_PTS_OFF_TOV;
  var PCT_PTS_PAINT;
  var PCT_AST_2PM;
  var PCT_UAST_2PM;
  var PCT_AST_3PM;
  var PCT_UAST_3PM;
  var PCT_AST_FGM;
  var PCT_UAST_FGM;
  var GP_RANK;
  var W_RANK;
  var L_RANK;
  var W_PCT_RANK;
  var MIN_RANK;
  var PCT_FGA_2PT_RANK;
  var PCT_FGA_3PT_RANK;
  var PCT_PTS_2PT_RANK;
  var PCT_PTS_2PT_MR_RANK;
  var PCT_PTS_3PT_RANK;
  var PCT_PTS_FB_RANK;
  var PCT_PTS_FT_RANK;
  var PCT_PTS_OFF_TOV_RANK;
  var PCT_PTS_PAINT_RANK;
  var PCT_AST_2PM_RANK;
  var PCT_UAST_2PM_RANK;
  var PCT_AST_3PM_RANK;
  var PCT_UAST_3PM_RANK;
  var PCT_AST_FGM_RANK;
  var PCT_UAST_FGM_RANK;
  var CFID;
  var CFPARAMS;

  ScoringStatsLeague(dynamic json) {
    TEAMID = json[0];
    TEAM_NAME = json[1];
    GP = json[2];
    W = json[3];
    L = json[4];
    W_PCT = json[5];
    MIN = json[6];
    PCT_FGA_2PT = json[7];
    PCT_FGA_3PT = json[8];
    PCT_PTS_2PT = json[9];
    PCT_PTS_2PT_MR = json[10];
    PCT_PTS_3PT = json[11];
    PCT_PTS_FB = json[12];
    PCT_PTS_FT = json[13];
    PCT_PTS_OFF_TOV = json[14];
    PCT_PTS_PAINT = json[15];
    PCT_AST_2PM = json[16];
    PCT_UAST_2PM = json[17];
    PCT_AST_3PM = json[18];
    PCT_UAST_3PM = json[19];
    PCT_AST_FGM = json[20];
    PCT_UAST_FGM = json[21];
    GP_RANK = json[22];
    W_RANK = json[23];
    L_RANK = json[24];
    W_PCT_RANK = json[25];
    MIN_RANK = json[26];
    PCT_FGA_2PT_RANK = json[27];
    PCT_FGA_3PT_RANK = json[28];
    PCT_PTS_2PT_RANK = json[29];
    PCT_PTS_2PT_MR_RANK = json[30];
    PCT_PTS_3PT_RANK = json[31];
    PCT_PTS_FB_RANK = json[32];
    PCT_PTS_FT_RANK = json[33];
    PCT_PTS_OFF_TOV_RANK = json[34];
    PCT_PTS_PAINT_RANK = json[35];
    PCT_AST_2PM_RANK = json[36];
    PCT_UAST_2PM_RANK = json[37];
    PCT_AST_3PM_RANK = json[38];
    PCT_UAST_3PM_RANK = json[39];
    PCT_AST_FGM_RANK = json[40];
    PCT_UAST_FGM_RANK = json[41];
    CFID = json[42];
    CFPARAMS = json[43];
  }
}

class ScoringStatsLeagueList {
  List<ScoringStatsLeague> items = [];

  ScoringStatsLeagueList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(ScoringStatsLeague(s));
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

  void sortPctFga2pt(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_FGA_2PT > a.PCT_FGA_2PT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_FGA_2PT > b.PCT_FGA_2PT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctFga3pt(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_FGA_3PT > a.PCT_FGA_3PT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_FGA_3PT > b.PCT_FGA_3PT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPts2pt(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_2PT > a.PCT_PTS_2PT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_2PT > b.PCT_PTS_2PT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPts3pt(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_3PT > a.PCT_PTS_3PT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_3PT > b.PCT_PTS_3PT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPts2ptMr(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_2PT_MR > a.PCT_PTS_2PT_MR)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_2PT_MR > b.PCT_PTS_2PT_MR)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPtsFb(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_FB > a.PCT_PTS_FB)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_FB > b.PCT_PTS_FB)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPtsFt(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_FT > a.PCT_PTS_FT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_FT > b.PCT_PTS_FT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPtsTov(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_OFF_TOV > a.PCT_PTS_OFF_TOV)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_OFF_TOV > b.PCT_PTS_OFF_TOV)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctPtsPaint(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_PTS_PAINT > a.PCT_PTS_PAINT)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_PTS_PAINT > b.PCT_PTS_PAINT)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctAST2pm(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_AST_2PM > a.PCT_AST_2PM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_AST_2PM > b.PCT_AST_2PM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctUAST2pm(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_UAST_2PM > a.PCT_UAST_2PM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_UAST_2PM > b.PCT_UAST_2PM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctAST3pm(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_AST_3PM > a.PCT_AST_3PM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_AST_3PM > b.PCT_AST_3PM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctUAST3pm(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_UAST_3PM > a.PCT_UAST_3PM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_UAST_3PM > b.PCT_UAST_3PM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctAstFgm(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_AST_FGM > a.PCT_AST_FGM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_AST_FGM > b.PCT_AST_FGM)
          return 1;
        else
          return -1;
      });
    }
  }

  void sortPctUAstFgm(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.PCT_UAST_FGM > a.PCT_UAST_FGM)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (a.PCT_UAST_FGM > b.PCT_UAST_FGM)
          return 1;
        else
          return -1;
      });
    }
  }
}
