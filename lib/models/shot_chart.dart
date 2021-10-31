class PlayerShotChart {
  var gridType;
  var gameId;
  var gameEventId; // This might be the play-by-play event, or it might link to the video
  var playerId;
  var playerName;
  var teamId;
  var teamName;
  var period;
  var minutesRemaining;
  var secondsRemaining;
  var eventType;
  var actionType;
  var shotType;
  var shotZoneBasic;
  var shotZoneArea;
  var shotZoneRange;
  var shotDistance;
  var locX;
  var locY;
  var shotAttemptedFlag;
  var shotMadeFlag;
  var gameDate;
  var homeTeam;
  var visitingTeam;

  PlayerShotChart(dynamic json) {
    gridType = json[0];
    gameId = json[1];
    gameEventId = json[2];
    playerId = json[3];
    playerName = json[4];
    teamId = json[5];
    teamName = json[6];
    period = json[7];
    minutesRemaining = json[8];
    secondsRemaining = json[9];
    eventType = json[10];
    actionType = json[11];
    shotType = json[12];
    shotZoneBasic = json[13];
    shotZoneArea = json[14];
    shotZoneRange = json[15];
    shotDistance = json[16];
    locX = json[17];
    locY = json[18];
    shotAttemptedFlag = json[19];
    shotMadeFlag = json[20];
    gameDate = json[21];
    homeTeam = json[22];
    visitingTeam = json[23];
  }
}

class PlayerShotChartList {
  List<PlayerShotChart> items = [];

  PlayerShotChartList(dynamic json) {
    for (var s in json["resultSets"]["rowSet"]) {
      items.add(PlayerShotChart(s));
    }
  }
}
