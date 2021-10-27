class PlayerDefenseStatAndRank {
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
  var defRtg;
  var dReb;
  var dRebPct;
  var pctDReb;
  var stl;
  var pctStl;
  var blk;
  var pctBlk;
  var oppPtsOffTov;
  var oppPts2ndChance;
  var oppPtsFb;
  var oppPtsPaint;
  var defWS;
  var gamesPlayedRank;
  var winsRank;
  var lossesRank;
  var winPctRank;
  var minutesRank;
  var defRtgRank;
  var dRebRank;
  var dRebPctRank;
  var pctDRebRank;
  var stlRank;
  var pctStlRank;
  var blkRank;
  var pctBlkRank;
  var oppPtsOffTovRank;
  var oppPts2ndChanceRank;
  var oppPtsFbRank;
  var oppPtsPaintRank;
  var defWSRank;

  PlayerDefenseStatAndRank(dynamic json) {
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
    defRtg = json[11];
    dReb = json[12];
    dRebPct = json[13];
    pctDReb = json[14];
    stl = json[15];
    pctStl = json[16];
    blk = json[17];
    pctBlk = json[18];
    oppPtsOffTov = json[19];
    oppPts2ndChance = json[20];
    oppPtsFb = json[21];
    oppPtsPaint = json[22];
    defWS = json[23];
    gamesPlayedRank = json[24];
    winsRank = json[25];
    lossesRank = json[26];
    winPctRank = json[27];
    minutesRank = json[28];
    defRtgRank = json[29];
    dRebRank = json[30];
    dRebPctRank = json[31];
    pctDRebRank = json[32];
    stlRank = json[33];
    pctStlRank = json[34];
    blkRank = json[35];
    pctBlkRank = json[36];
    oppPtsOffTovRank = json[37];
    oppPts2ndChanceRank = json[38];
    oppPtsFbRank = json[39];
    oppPtsPaintRank = json[40];
    defWSRank = json[41];
  }
}

class PlayerDefenseStatAndRankList {
  List<PlayerDefenseStatAndRank> items = [];

  PlayerDefenseStatAndRankList(dynamic json) {
    for (var l in json[0]["rowSet"]) {
      items.add(PlayerDefenseStatAndRank(l));
    }
  }
}
