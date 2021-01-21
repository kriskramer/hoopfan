class TeamLineup {
  String GROUP_ID;
  String GROUP_NAME;
  int GP;
  int W;
  int L;
  double W_PCT;
  double MIN;
  int FGM;
  int FGA;
  double FG_PCT;
  int FG3M;
  int FG3A;
  double FG3_PCT;
  int FTM;
  int FTA;
  double FT_PCT;
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

  TeamLineup(dynamic json) {
    GROUP_ID = json[1];
    GROUP_NAME = json[2];
    GP = json[3];
    W = json[4];
    L = json[5];
    W_PCT = json[6];
    MIN = json[7];
    FGM = json[8];
    FGA = json[9];
    FG_PCT = json[10];
    FG3M = json[11];
    FG3A = json[12];
    FG3_PCT = json[13];
    FTM = json[14];
    FTA = json[15];
    FT_PCT = json[16];
    OREB = json[17];
    DREB = json[18];
    REB = json[19];
    AST = json[20];
    TOV = json[21];
    STL = json[22];
    BLK = json[23];
    BLKA = json[23];
    PF = json[25];
    PFD = json[26];
    PTS = json[27];
    PLUS_MINUS = json[28];
  }
}

class TeamLineupList {
  List<TeamLineup> items = List<TeamLineup>();
  dynamic originalJson;
  List<String> filteredPlayers = List<String>();

  TeamLineupList(dynamic json) {
    originalJson = json;
    loadJson();
  }

  void loadJson() {
    items.clear();
    for (var l in originalJson["resultSets"][1]["rowSet"]) {
      items.add(TeamLineup(l));
    }
  }

  void addFilterPlayer(String playerId) {
    if (!filteredPlayers.contains(playerId)) filteredPlayers.add(playerId);
    filterByPlayers();
  }

  void removeFilterPlayer(String playerId) {
    filteredPlayers.remove(playerId);
    filterByPlayers();
  }

  void filterByPlayers() {
    loadJson();
    List<TeamLineup> newList = List<TeamLineup>();
    String player1Id = "-";
    String player2Id = "-";
    String player3Id = "-";
    String player4Id = "-";
    String player5Id = "-";

    if (filteredPlayers.length > 0) {
      if (filteredPlayers[0] != null) {
        player1Id = filteredPlayers[0].toString();
      }
    }
    if (filteredPlayers.length > 1) {
      if (filteredPlayers[1] != null) {
        player2Id = filteredPlayers[1].toString();
      }
    }
    if (filteredPlayers.length > 2) {
      if (filteredPlayers[2] != null) {
        player3Id = filteredPlayers[2].toString();
      }
    }
    if (filteredPlayers.length > 3) {
      if (filteredPlayers[3] != null) {
        player4Id = filteredPlayers[3].toString();
      }
    }
    if (filteredPlayers.length > 4) {
      if (filteredPlayers[4] != null) {
        player5Id = filteredPlayers[4].toString();
      }
    }

    for (var l in items) {
      if (l.GROUP_ID.contains(player1Id) &&
          l.GROUP_ID.contains(player2Id) &&
          l.GROUP_ID.contains(player3Id) &&
          l.GROUP_ID.contains(player4Id) &&
          l.GROUP_ID.contains(player5Id)) {
        newList.add(l);
      }
    }
    items = newList;

    // items = items.where((p) {
    //   return p.GROUP_ID.contains(player1Id) &&
    //       p.GROUP_ID.contains(player2Id) &&
    //       p.GROUP_ID.contains(player3Id) &&
    //       p.GROUP_ID.contains(player4Id) &&
    //       p.GROUP_ID.contains(player5Id);
    // });
  }
}
