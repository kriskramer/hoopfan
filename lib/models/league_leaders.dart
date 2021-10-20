class LeagueLeader {
  var playerId;
  var rank;
  var player;
  var team;
  var gp;
  var min;
  var fgm;
  var fga;
  var fgpct;
  var fg3m;
  var fg3a;
  var fg3pct;
  var ftm;
  var fta;
  var ftpct;
  var oreb;
  var dreb;
  var reb;
  var ast;
  var stl;
  var blk;
  var tov;
  var pts;
  var eff;

  LeagueLeader(dynamic json) {
    playerId = json[0];
    rank = json[1];
    player = json[2];
    team = json[3];
    gp = json[4];
    min = json[5];
    fgm = json[6];
    fga = json[7];
    fgpct = json[8];
    fg3m = json[9];
    fg3a = json[10];
    fg3pct = json[11];
    ftm = json[12];
    fta = json[13];
    ftpct = json[14];
    oreb = json[15];
    dreb = json[16];
    reb = json[17];
    ast = json[18];
    stl = json[19];
    blk = json[20];
    tov = json[21];
    pts = json[22];
    eff = json[23];
  }
}

class LeagueLeaderList {
  List<LeagueLeader> items = [];

  LeagueLeaderList(dynamic json) {
    for (var l in json["resultSet"]["rowSet"]) {
      items.add(LeagueLeader(l));
    }
  }
}
