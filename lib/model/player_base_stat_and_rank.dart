class PlayerBaseStatAndRank {
  var playerId;
  var playerName;
  var nickname;
  var teamId;
  var teamAbbreviation;
  var age;
  var gamesPlayed;
  var wins;
  var losses;
  var winPct;
  var minutes;
  var fgm;
  var fga;
  var fgPct;
  var fg3m;
  var fg3a;
  var fg3Pct;
  var ftm;
  var fta;
  var ftPct;
  var oReb;
  var dReb;
  var reb;
  var ast;
  var tov;
  var stl;
  var blk;
  var blka;
  var pf;
  var pfd;
  var pts;
  var plusMinus;
  var fantasyPts;
  var dd2;
  var td3;
  var gpRank;
  var winsRank;
  var lossesRank;
  var winPctRank;
  var minutesRank;
  var fgmRank;
  var fgaRank;
  var fgPctRank;
  var fg3mRank;
  var fg3aRank;
  var fg3PctRank;
  var ftmRank;
  var ftaRank;
  var ftPctRank;
  var oRebRank;
  var dRebRank;
  var rebRank;
  var astRank;
  var tovRank;
  var stlRank;
  var blkRank;
  var blkaRank;
  var pfRank;
  var pfdRank;
  var ptsRank;
  var plusMinusRank;
  var fantasyPtsRank;
  var dd2Rank;
  var td3Rank;

  PlayerBaseStatAndRank(dynamic json) {
    playerId = json[0];
    playerName = json[1];
    nickname = json[2];
    teamId = json[3];
    teamAbbreviation = json[4];
    age = json[5];
    gamesPlayed = json[6];
    wins = json[7];
    losses = json[8];
    winPct = json[9];
    minutes = json[10];
    fgm = json[11];
    fga = json[12];
    fgPct = json[13];
    fg3m = json[14];
    fg3a = json[15];
    fg3Pct = json[16];
    ftm = json[17];
    fta = json[18];
    ftPct = json[19];
    oReb = json[20];
    dReb = json[21];
    reb = json[22];
    ast = json[23];
    tov = json[24];
    stl = json[25];
    blk = json[26];
    blka = json[27];
    pf = json[28];
    pfd = json[29];
    pts = json[30];
    plusMinus = json[31];
    fantasyPts = json[32];
    dd2 = json[33];
    td3 = json[34];
    gpRank = json[35];
    winsRank = json[36];
    lossesRank = json[37];
    winPctRank = json[38];
    minutesRank = json[39];
    fgmRank = json[40];
    fgaRank = json[41];
    fgPctRank = json[42];
    fg3mRank = json[43];
    fg3aRank = json[44];
    fg3PctRank = json[45];
    ftmRank = json[46];
    ftaRank = json[47];
    ftPctRank = json[48];
    oRebRank = json[49];
    dRebRank = json[50];
    rebRank = json[51];
    astRank = json[52];
    tovRank = json[53];
    stlRank = json[54];
    blkRank = json[55];
    blkaRank = json[56];
    pfRank = json[57];
    pfdRank = json[58];
    ptsRank = json[59];
    plusMinusRank = json[60];
    fantasyPtsRank = json[61];
    dd2Rank = json[62];
    td3Rank = json[63];
  }
}

class PlayerBaseStatAndRankList {
  List<PlayerBaseStatAndRank> items = [];

  PlayerBaseStatAndRankList(dynamic json) {
    for (var l in json[0]["rowSet"]) {
      items.add(PlayerBaseStatAndRank(l));
    }
  }
}

// class PlayerStatLoader { 
//   static getBaseStatsList(BuildContext context) {
//     var json =
//         Provider.of<JsonFiles>(context, listen: false).getAllPlayerStats();

//     if (json == null) {
//       json = Network.getJson(
//         Urls.getNbaStatsAllPlayerStats(),
//         requestHeaders: RequestHeaders.nbaStatsHeaders,
//       );

//       Provider.of<JsonFiles>(context, listen: false).setAllPlayerStats(json);
//     }

//     PlayerBaseStatAndRankList list = PlayerBaseStatAndRankList(json);

//     return list;
//   }
// }
