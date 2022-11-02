class GameData {
  String gameId;
  String gameTimeLocal;
  String gameTimeUTC;
  String gameTimeHome;
  String gameTimeAway;
  String gameEt;
  int duration;
  String gameCode;
  String gameStatusText;
  int gameStatus;
  int regulationPeriods;
  int period;
  String gameClock;
  int attendance;
  String sellout;
  GameArena arena;
  GameOfficialList officials;
  GameTeam homeTeam;
  GameTeam awayTeam;

  GameData(dynamic json) {
    gameId = json["gameId"];
    gameTimeLocal = json["gameTimeLocal"];
    gameTimeUTC = json["gameTimeUTC"];
    gameTimeHome = json["gameTimeHome"];
    gameTimeAway = json["gameTimeAway"];
    gameEt = json["gameEt"];
    duration = json["duration"];
    gameClock = json["gameCode"];
    gameStatusText = json["gameStatusText"];
    gameStatus = json["gameStatus"];
    regulationPeriods = json["regulationPeriods"];
    period = json["period"];
    gameClock = json["gameClock"];
    attendance = json["attendance"];
    sellout = json["sellout"];
    arena = GameArena(json["arena"]);
    officials = GameOfficialList(json["officials"]);
    homeTeam = GameTeam(json["homeTeam"], true);
    awayTeam = GameTeam(json["awayTeam"], false);
  }
}

class TeamStatistics {
  int assists;
  double assistsTurnoverRatio;
  int benchPoints;
  int biggestLead;
  String biggestLeadScore;
  int biggestScoringRun;
  String biggestScoringRunScore;
  int blocks;
  int blocksReceived;
  int fastBreakPointsAttempted;
  int fastBreakPointsMade;
  double fastBreakPointsPercentage;
  int fieldGoalsAttempted;
  double fieldGoalsEffectiveAdjusted;
  int fieldGoalsMade;
  double fieldGoalsPercentage;
  int foulsOffensive;
  int foulsDrawn;
  int foulsPersonal;
  int foulsTeam;
  int foulsTechnical;
  int foulsTeamTechnical;
  int freeThrowsAttempted;
  int freeThrowsMade;
  double freeThrowsPercentage;
  int leadChanges;
  String minutes;
  String minutesCalculated;
  int points;
  int pointsAgainst;
  int pointsFastBreak;
  int pointsFromTurnovers;
  int pointsInThePaint;
  int pointsInThePaintAttempted;
  int pointsInThePaintMade;
  double pointsInThePaintPercentage;
  int pointsSecondChance;
  int reboundsDefensive;
  int reboundsOffensive;
  int reboundsPersonal;
  int reboundsTeam;
  int reboundsTeamDefensive;
  int reboundsTeamOffensive;
  int reboundsTotal;
  int secondChancePointsAttempted;
  int secondChancePointsMade;
  double secondChancePointsPercentage;
  int steals;
  int threePointersAttempted;
  int threePointersMade;
  double threePointersPercentage;
  String timeLeading;
  int timesTied;
  double trueShootingAttempts;
  double trueShootingPercentage;
  int turnovers;
  int turnoversTeam;
  int turnoversTotal;
  int twoPointersAttempted;
  int twoPointersMade;
  double twoPointersPercentage;

  TeamStatistics(dynamic json) {
    assists = json["assists"];
    assistsTurnoverRatio =
        double.parse(json["assistsTurnoverRatio"].toString());
    benchPoints = json["benchPoints"];
    biggestLead = json["biggestLead"];
    biggestLeadScore = json["biggestLeadScore"];
    biggestScoringRun = json["biggestScoringRun"];
    biggestScoringRunScore = json["biggestScoringRunScore"];
    blocks = json["blocks"];
    blocksReceived = json["blocksReceived"];
    fastBreakPointsAttempted = json["fastBreakPointsAttempted"];
    fastBreakPointsMade = json["fastBreakPointsMade"];
    fastBreakPointsPercentage =
        double.parse(json["fastBreakPointsPercentage"].toString());
    fieldGoalsAttempted = json["fieldGoalsAttempted"];
    fieldGoalsMade = json["fieldGoalsMade"];
    fieldGoalsPercentage = json["fieldGoalsPercentage"];
    foulsOffensive = json["foulsOffensive"];
    foulsDrawn = json["foulsDrawn"];
    foulsPersonal = json["foulsPersonal"];
    foulsTechnical = json["foulsTechnical"];
    foulsTeam = json["foulsTeam"];
    foulsTeamTechnical = json["foulsTeamTechnical"];
    freeThrowsAttempted = json["freeThrowsAttempted"];
    freeThrowsMade = json["freeThrowsMade"];
    freeThrowsPercentage =
        double.parse(json["freeThrowsPercentage"].toString());
    minutes = json["minutes"];
    minutesCalculated = json["minutesCalculated"];
    points = json["points"];
    pointsFastBreak = json["pointsFastBreak"];
    pointsInThePaint = json["pointsInThePaint"];
    pointsSecondChance = json["pointsSecondChance"];
    reboundsDefensive = json["reboundsDefensive"];
    reboundsOffensive = json["reboundsOffensive"];
    reboundsTotal = json["reboundsTotal"];
    secondChancePointsAttempted = json["secondChancePointsAttempted"];
    secondChancePointsMade = json["secondChancePointsMade"];
    secondChancePointsPercentage =
        double.parse(json["secondChancePointsPercentage"].toString());
    steals = json["steals"];
    threePointersAttempted = json["threePointersAttempted"];
    threePointersMade = json["threePointersMade"];
    threePointersPercentage = json["threePointersPercentage"];
    turnovers = json["turnovers"];
    twoPointersAttempted = json["twoPointersAttempted"];
    twoPointersMade = json["twoPointersMade"];
    twoPointersPercentage = json["twoPointersPercentage"];
    leadChanges = json["leadChanges"];
    pointsAgainst = json["pointsAgainst"];
    pointsFromTurnovers = json["pointsFromTurnovers"];
    pointsInThePaintAttempted = json["pointsInThePaintAttempted"];
    pointsInThePaintMade = json["pointsInThePaintMade"];
    pointsInThePaintPercentage = json["pointsInThePaintPercentage"];
    reboundsTeam = json["reboundsTeam"];
    reboundsTeamDefensive = json["reboundsTeamDefensive"];
    reboundsTeamOffensive = json["reboundsTeamOffensive"];
    timeLeading = json["timeLeading"];
    timesTied = json["timesTied"];
    trueShootingAttempts =
        double.parse(json["trueShootingAttempts"].toString());
    trueShootingPercentage = json["trueShootingPercentage"];
    turnoversTeam = json["turnoversTeam"];
    turnoversTotal = json["turnoversTotal"];
  }
}

class GameArena {
  int arenaId;
  String arenaName;
  String arenaCity;
  String arenaState;
  String arenaCountry;
  String arenaTimezone;

  GameArena(dynamic json) {
    arenaId = json["arenaId"];
    arenaName = json["arenaName"];
    arenaCity = json["arenaCity"];
    arenaState = json["arenaState"];
    arenaCountry = json["arenaCountry"];
    arenaTimezone = json["arenaTimezone"];
  }
}

class GameOfficial {
  int personId;
  String name;
  String nameI;
  String firstName;
  String familyName;
  String jerseyNum;
  String assignment;

  GameOfficial(dynamic json) {
    personId = json["personId"];
    name = json["name"];
    nameI = json["nameI"];
    firstName = json["firstName"];
    familyName = json["familyName"];
    jerseyNum = json["jerseyNum"];
    assignment = json["assignment"];
  }
}

class GameOfficialList {
  List<GameOfficial> officials = [];

  GameOfficialList(dynamic json) {
    for (var o in json) {
      officials.add(GameOfficial(o));
    }
  }
}

class GamePlayer {
  String status;
  int order;
  int personId;
  String jerseyNum;
  String position;
  String starter;
  String oncourt;
  String played;
  GamePlayerStatistics statistics;
  String name;
  String nameI;
  String firstName;
  String familyName;

  GamePlayer(dynamic json) {
    status = json["status"];
    order = json["order"];
    personId = json["personId"];
    jerseyNum = json["jerseyNum"];
    position = json["position"];
    starter = json["starter"];
    oncourt = json["oncourt"];
    played = json["played"];
    name = json["name"];
    nameI = json["nameI"];
    firstName = json["firstName"];
    familyName = json["familyName"];
    statistics = GamePlayerStatistics(json["statistics"]);
  }
}

class GamePlayerList {
  List<GamePlayer> players = [];

  GamePlayerList(dynamic json) {
    for (var p in json) {
      players.add(GamePlayer(p));
    }
  }
}

class GamePlayerStatistics {
  int assists;
  int blocks;
  int blocksReceived;
  int fieldGoalsAttempted;
  int fieldGoalsMade;
  double fieldGoalsPercentage;
  int foulsOffensive;
  int foulsDrawn;
  int foulsPersonal;
  int foulsTechnical;
  int freeThrowsAttempted;
  int freeThrowsMade;
  double freeThrowsPercentage;
  int minus;
  String minutes;
  String minutesCalculated;
  int plus;
  int plusMinusPoints;
  int points;
  int pointsFastBreak;
  int pointsInThePaint;
  int pointsSecondChance;
  int reboundsDefensive;
  int reboundsOffensive;
  int reboundsTotal;
  int secondChancePointsAttempted;
  int secondChancePointsMade;
  int secondChancePointsPercentage;
  int steals;
  int threePointersAttempted;
  int threePointersMade;
  double threePointersPercentage;
  int turnovers;
  int twoPointersAttempted;
  int twoPointersMade;
  double twoPointersPercentage;

  GamePlayerStatistics(dynamic json) {
    assists = json["assists"];
    blocks = json["blocks"];
    blocksReceived = json["blocksReceived"];
    fieldGoalsAttempted = json["fieldGoalsAttempted"];
    fieldGoalsMade = json["fieldGoalsMade"];
    fieldGoalsPercentage =
        double.parse(json["fieldGoalsPercentage"].toString());
    foulsOffensive = json["foulsOffensive"];
    foulsDrawn = json["foulsDrawn"];
    foulsPersonal = json["foulsPersonal"];
    foulsTechnical = json["foulsTechnical"];
    freeThrowsAttempted = json["freeThrowsAttempted"];
    freeThrowsMade = json["freeThrowsMade"];
    freeThrowsPercentage =
        double.parse(json["freeThrowsPercentage"].toString());
    minus = json["minus"];
    minutes = json["minutes"];
    minutesCalculated = json["minutesCalculated"];
    plus = json["plus"];
    plusMinusPoints = json["plusMinusPoints"];
    points = json["points"];
    pointsFastBreak = json["pointsFastBreak"];
    pointsInThePaint = json["pointsInThePaint"];
    pointsSecondChance = json["pointsSecondChance"];
    reboundsDefensive = json["reboundsDefensive"];
    reboundsOffensive = json["reboundsOffensive"];
    reboundsTotal = json["reboundsTotal"];
    secondChancePointsAttempted = json["secondChancePointsAttempted"];
    secondChancePointsMade = json["secondChancePointsMade"];
    secondChancePointsPercentage = json["secondChancePointsPercentage"];
    steals = json["steals"];
    threePointersAttempted = json["threePointersAttempted"];
    threePointersMade = json["threePointersMade"];
    threePointersPercentage =
        double.parse(json["threePointersPercentage"].toString());
    turnovers = json["turnovers"];
    twoPointersAttempted = json["twoPointersAttempted"];
    twoPointersMade = json["twoPointersMade"];
    twoPointersPercentage =
        double.parse(json["twoPointersPercentage"].toString());
  }
}

class GameTeam {
  bool isHomeTeam;
  int teamId;
  String teamName;
  String teamCity;
  String teamTricode;
  int score;
  String inBonus;
  int timeoutsRemaining;
  GamePlayerList players;
  GamePeriodList periods;
  TeamStatistics statistics;

  GameTeam(dynamic json, bool isHomeTeam) {
    isHomeTeam = isHomeTeam;
    teamId = json["teamId"];
    teamName = json["teamName"];
    teamCity = json["teamCity"];
    teamTricode = json["teamTricode"];
    score = json["score"];
    inBonus = json["inBonus"];
    timeoutsRemaining = json["timeoutsRemaining"];
    players = GamePlayerList(json["players"]);
    periods = GamePeriodList(json["periods"]);
    statistics = TeamStatistics(json["statistics"]);
  }
}

class GamePeriod {
  int period;
  String periodType;
  int score;

  GamePeriod(dynamic json) {
    period = json["period"];
    periodType = json["periodType"];
    score = json["score"];
  }
}

class GamePeriodList {
  List<GamePeriod> periods = [];

  GamePeriodList(dynamic json) {
    for (var p in json) {
      periods.add(GamePeriod(p));
    }
  }
}
