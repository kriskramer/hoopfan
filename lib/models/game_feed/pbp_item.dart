class PbpItem {
  int timestamp;
  String clock;
  int period;
  String eventMsgType;
  String description;
  String formattedDescription;
  var personId;
  var teamId;
  var vTeamScore;
  var hTeamScore;
  bool isScoreChange;
  bool isVideoAvailable;
  String type;
  String chat;
  String displayName;
  int fanLevel;
  int cheers;
  int boos;

  PbpItem(String ts, dynamic json) {
    timestamp = int.parse(ts);
    clock = json["clock"];
    period = json["period"];
    eventMsgType = json["eventMsgType"];
    description = json["description"];
    if (json["formatted"] != null) {
      formattedDescription = json["formatted"]["description"];
    }
    personId = json["personId"];
    teamId = json["teamId"];
    vTeamScore = json["vTeamScore"];
    hTeamScore = json["hTeamScore"];
    isScoreChange = json["isScoreChange"];
    isVideoAvailable = json["isVideoAvailable"];
    type = json["type"];
    chat = json["chat"];
    displayName = json["displayName"];
    fanLevel = json["fanLevel"] == null ? 0 : json["fanLevel"];
    cheers = json["cheers"];
    boos = json["boos"];
  }

  ScoreTextBreakdown getTextBreakdown() {
    return new ScoreTextBreakdown(description);
  }
}

class FeedList {
  List<PbpItem> items = [];

  void sort() {
    items.sort((a, b) {
      if (b.timestamp < a.timestamp)
        return 1;
      else
        return -1;
    });
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
