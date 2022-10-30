class PbpItem {
  int timestamp;
  String clock;
  int period;
  String periodType;
  String eventMsgType;
  String description;
  String formattedDescription;
  int personId;
  int teamId;
  int vTeamScore;
  int hTeamScore;
  String timeActual;
  int actionNumber;
  String actionType;
  String subType;
  int isFieldGoal;
  bool isScoreChange;
  String teamTricode;
  String descriptor;
  dynamic qualifiers;
  double x;
  double y;
  //double xLegacy;
  //double yLegacy;
  String area;
  String areaDetail;
  String side;
  double shotDistance;
  int possession;
  String edited;
  int orderNumber;
  String shotResult;
  String playerName;
  String playerNameI;
  dynamic personIdsFilter;

  String type;
  String chat;
  String displayName;
  int fanLevel;
  int cheers;
  int boos;

  PbpItem(String ts, dynamic json) {
    type = json["pbp"] == null ? "2" : "1";
    timestamp = int.parse(ts);

    if (json["pbp"] != null) {
      actionNumber = json["pbp"]["actionNumber"];
      actionType = json["pbp"]["actionType"];
      subType = json["pbp"]["subType"];
      timeActual = json["pbp"]["timeActual"];
      periodType = json["pbp"]["periodType"];

      teamTricode = json["pbp"]["teamTricode"];
      descriptor = json["pbp"]["descriptor"];
      qualifiers = json["pbp"]["qualifiers"];
      personId = json["pbp"][""];
      x = GetDoubleFromJson(json["pbp"]["x"]);
      y = GetDoubleFromJson(json["pbp"]["y"]);
      area = json["pbp"]["area"];
      areaDetail = json["pbp"]["areaDetail"];
      side = json["pbp"]["side"];
      shotDistance = GetDoubleFromJson(json["pbp"]["shotDistance"]);
      possession = json["pbp"]["possession"];
      edited = json["pbp"]["edited"];
      orderNumber = json["pbp"]["orderNumber"];
      //xLegacy = json["pbp"]["xLegacy"];
      //yLegacy = json["pbp"]["yLegacy"];
      isFieldGoal = json["pbp"]["isFieldGoal"];
      shotResult = json["pbp"]["shotResult"];
      description = json["pbp"]["description"];
      playerName = json["pbp"]["playerName"];
      playerNameI = json["pbp"]["playerNameI"];
      personIdsFilter = json["pbp"]["personIdsFilter"];
      isScoreChange = json["pbp"]["shotResult"] == "Made";

      clock = json["pbp"]["clock"];
      period = json["pbp"]["period"];
      eventMsgType = json["pbp"]["actionType"];
      description = json["pbp"]["description"];
      personId = json["pbp"]["personId"];
      teamId = json["pbp"]["teamId"];
      vTeamScore = int.parse(json["pbp"]["scoreAway"]);
      hTeamScore = int.parse(json["pbp"]["scoreHome"]);
    } else if (json["chat"] != null) {
      chat = json["chat"]["chat"];
      displayName = json["chat"]["displayName"];
      fanLevel =
          json["chat"]["fanLevel"] == null ? 0 : json["chat"]["fanLevel"];
      cheers = json["chat"]["cheers"];
      boos = json["chat"]["boos"];
    }
  }

  ScoreTextBreakdown getTextBreakdown() {
    return new ScoreTextBreakdown(description);
  }

  String clockFormatted() {
    String c = clock
        .replaceAll("PT", "")
        .replaceAll("M", ":")
        .replaceAll("S", "")
        .replaceAll("00:", "");
    return c;
  }

  double GetDoubleFromJson(dynamic value) {
    if (value == null)
      return 0;
    else {
      return double.parse(value.toString());
    }
  }
}

class FeedList {
  List<PbpItem> items = [];

  void sort() {
    items.sort((a, b) {
      if (a.type == b.type && a.type == "1") {
        if (b.actionNumber < a.actionNumber)
          return 1;
        else
          return -1;
      } else {
        if (b.timestamp < a.timestamp)
          return 1;
        else
          return -1;
      }
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
