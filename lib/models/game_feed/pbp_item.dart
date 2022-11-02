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
    //if (json["chat"] != null) type = "2";
    //if (json["pbp"] != null) type = "1";
    //type = json["pbp"]["type"] == null ? "1" : json["pbp"]["type"];

    //timestamp = int.parse(ts);

    //if (type == "1") {
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
    cheers = json["pbp"]["cheers"];
    boos = json["pbp"]["boos"];
    fanLevel = json["pbp"]["fanLevel"] == null ? 0 : json["pbp"]["fanLevel"];
    // }

    // if (type == "2") {
    //   cheers = json["pbp"]["cheers"];
    //   boos = json["pbp"]["boos"];
    //   chat = json["pbp"]["chat"];
    //   displayName = json["pbp"]["displayName"];
    //   fanLevel = json["pbp"]["fanLevel"] == null ? 0 : json["pbp"]["fanLevel"];
    // }
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

class FeedList2 {
  List<PbpItem2> items = [];

  void sort() {
    items.sort((a, b) {
      if (a.type == b.type && a.type == "1") {
        if (b.orderNumber < a.orderNumber)
          return 1;
        else
          return -1;
      } else {
        if (b.orderNumber < a.orderNumber)
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

class PbpItem2 {
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

  PbpItem2(dynamic json) {
    actionNumber = json["actionNumber"];
    actionType = json["actionType"];
    subType = json["subType"];
    timeActual = json["timeActual"];
    periodType = json["periodType"];

    teamTricode = json["teamTricode"];
    descriptor = json["descriptor"];
    qualifiers = json["qualifiers"];
    personId = json[""];
    x = GetDoubleFromJson(json["x"]);
    y = GetDoubleFromJson(json["y"]);
    area = json["area"];
    areaDetail = json["areaDetail"];
    side = json["side"];
    shotDistance = GetDoubleFromJson(json["shotDistance"]);
    possession = json["possession"];
    edited = json["edited"];
    orderNumber = json["orderNumber"];
    //xLegacy = json["xLegacy"];
    //yLegacy = json["yLegacy"];
    isFieldGoal = json["isFieldGoal"];
    shotResult = json["shotResult"];
    description = json["description"];
    playerName = json["playerName"];
    playerNameI = json["playerNameI"];
    personIdsFilter = json["personIdsFilter"];
    isScoreChange = json["shotResult"] == "Made";

    clock = json["clock"];
    period = json["period"];
    eventMsgType = json["actionType"];
    description = json["description"];
    personId = json["personId"];
    teamId = json["teamId"];
    vTeamScore = int.parse(json["scoreAway"]);
    hTeamScore = int.parse(json["scoreHome"]);
  }

  double GetDoubleFromJson(dynamic value) {
    if (value == null)
      return 0;
    else {
      return double.parse(value.toString());
    }
  }

  String clockFormatted() {
    String c = clock
        .replaceAll("PT", "")
        .replaceAll("M", ":")
        .replaceAll("S", "")
        .replaceAll("00:", "");
    return c;
  }
}
