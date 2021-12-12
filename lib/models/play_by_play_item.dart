class PlayByPlayItem {
  String clock;
  String eventMsgType;
  String description;
  var personId;
  var teamId;
  var vTeamScore;
  var hTeamScore;
  bool isScoreChange;
  bool isVideoAvailable;

  PlayByPlayItem(dynamic json) {
    clock = json["clock"];
    eventMsgType = json["eventMsgType"];
    description = json["description"];
    personId = json["personId"];
    teamId = json["teamId"];
    vTeamScore = json["vTeamScore"];
    hTeamScore = json["hTeamScore"];
    isScoreChange = json["isScoreChange"];
    isVideoAvailable = json["isVideoAvailable"];
  }

  ScoreTextBreakdown getTextBreakdown() {
    return new ScoreTextBreakdown(description);
  }
}

class ScoreTextBreakdown {
  String score;
  String shotText;
  String assistText;

  ScoreTextBreakdown(String description) {
    int iAssist = -1;
    int iScore = -1;
    int iShotType = -1;

    iAssist = description.indexOf('Assist');
    iShotType = description.indexOf('] ') + 2;
    iScore = description.indexOf('[');

    if (iAssist > -1) {
      assistText = description.substring(iAssist);
    }
    if (iShotType > -1 && iAssist > -1) {
      shotText = description.substring(iShotType, iAssist);
    }
    if (iScore > -1) {
      score = description.substring(iScore, iShotType - 1);
    }
  }
}
