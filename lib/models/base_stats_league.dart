class BaseStatsLeague {
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

  BaseStatsLeague(dynamic json) {
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

class BaseStatsLeagueList {
  List<BaseStatsLeague> items = [];

  BaseStatsLeagueList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(BaseStatsLeague(s));
    }
  }

  String getTopPoints() {
    for (BaseStatsLeague b in items) {
      if (b.PTS_RANK == 1) {
        return (b.PTS / b.GP).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomPoints() {
    for (BaseStatsLeague b in items) {
      if (b.PTS_RANK == 30) {
        return (b.PTS / b.GP).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgPoints() {
    var total = 0.0;
    for (BaseStatsLeague b in items) {
      total += b.PTS / b.GP;
    }

    return (total / 30).toStringAsFixed(2);
  }

  String getTopFGPct() {
    for (BaseStatsLeague b in items) {
      if (b.FG_PCT_RANK == 1) {
        return (b.FG_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getBottomFGPct() {
    for (BaseStatsLeague b in items) {
      if (b.FG_PCT_RANK == 30) {
        return (b.FG_PCT).toStringAsFixed(2);
      }
    }
    return "";
  }

  String getAvgFGPct() {
    var total = 0.0;
    for (BaseStatsLeague b in items) {
      total += b.FG_PCT;
    }

    return (total / 30).toStringAsFixed(2);
  }
}
