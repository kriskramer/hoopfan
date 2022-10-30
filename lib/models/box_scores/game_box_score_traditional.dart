import 'package:hoop/models/team_stats/ftp.dart';

class GameBoxScoreTraditional {
  String gameId;
  String teamId;
  String teamAbbreviation;
  String teamCity;
  String playerId;
  String playerName;
  String nickname;
  String startPosition;
  String comment;
  double min;
  int fgm;
  int fga;
  double fgPct;
  int fg3m;
  int fg3a;
  double fg3Pct;
  int ftm;
  int fta;
  double ftPct;
  int oreb;
  int dreb;
  int reb;
  int ast;
  int stl;
  int blk;
  int to;
  int pf;
  int pts;
  int plusMinus;

  GameBoxScoreTraditional(dynamic json) {
    gameId = json[0];
    teamId = json[1].toString();
    teamAbbreviation = json[2];
    teamCity = json[3];
    playerId = json[4].toString();
    playerName = json[5];
    startPosition = json[7];
    comment = json[8];
    min = json[9] == null ? "0" : json[9];
    fgm = json[10] == null ? 0.0 : json[10];
    fga = json[11] == null ? 0.0 : json[11];
    fgPct = json[12] == null ? 0.0 : json[12];
    fg3m = json[13] == null ? 0.0 : json[13];
    fg3a = json[14] == null ? 0.0 : json[14];
    fg3Pct = json[15] == null ? 0.0 : json[15];
    ftm = json[16] == null ? 0.0 : json[16];
    fta = json[17] == null ? 0.0 : json[17];
    ftPct = json[18] == null ? 0.0 : json[18];
    oreb = json[19] == null ? 0.0 : json[19];
    dreb = json[20] == null ? 0.0 : json[20];
    reb = json[21] == null ? 0.0 : json[21];
    ast = json[22] == null ? 0.0 : json[22];
    stl = json[23] == null ? 0.0 : json[23];
    blk = json[24] == null ? 0.0 : json[24];
    to = json[25] == null ? 0.0 : json[25];
    pf = json[26] == null ? 0.0 : json[26];
    pts = json[27] == null ? 0.0 : json[27];
    plusMinus = json[28] == null ? 0.0 : json[28];
  }
}

class GameBoxScoreAdvancedList {
  List<GameBoxScoreTraditional> items = List<GameBoxScoreTraditional>();

  GameBoxScoreAdvancedList(dynamic json, String teamId) {
    for (var b in json) {
      if (b[1].toString() == teamId) {
        items.add(GameBoxScoreTraditional(b));
      }
    }
  }

  void sortByPts(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (b.pts < a.pts)
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (b.pts > a.pts)
          return 1;
        else
          return -1;
      });
    }
  }

  // void sortByDefRtg(bool asc) {
  //   if (asc) {
  //     items.sort((a, b) {
  //       if (b.defRating < a.defRating)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   } else {
  //     items.sort((a, b) {
  //       if (b.defRating > a.defRating)
  //         return 1;
  //       else
  //         return -1;
  //     });
  //   }
  // }
}
