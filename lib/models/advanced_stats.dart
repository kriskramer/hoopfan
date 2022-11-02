import 'package:hoop/models/game_data.dart';

class AdvancedStats {
  final GameData stats;

  TeamGameStats vTeam;
  TeamGameStats hTeam;

  AdvancedStats({this.stats}) {
    this.vTeam = TeamGameStats(teamStats: stats.awayTeam.statistics);
    this.hTeam = TeamGameStats(teamStats: stats.homeTeam.statistics);
  }

  String getVTeamPoss() {
    double poss = (vTeam.fga +
            (vTeam.fta * 0.44) -
            hTeam.totalRebounds +
            vTeam.turnovers) *
        0.96;

    return poss.toStringAsFixed(0);
  }

  String getHTeamPoss() {
    double poss = (hTeam.fga +
            (hTeam.fta * 0.44) -
            vTeam.totalRebounds +
            hTeam.turnovers) *
        0.96;

    return poss.toStringAsFixed(0);
  }

  String getVTeamPace() {
    int vtp = int.parse(getVTeamPoss());
    int htp = int.parse(getHTeamPoss());

    double pace = 48 * (vtp + htp) / (2 * vTeam.minutes / 5);

    return pace.toStringAsFixed(1);
  }

  String getHTeamPace() {
    int vtp = int.parse(getVTeamPoss());
    int htp = int.parse(getHTeamPoss());

    double pace = 48 * (vtp + htp) / (2 * hTeam.minutes / 5);

    return pace.toStringAsFixed(1);
  }
}

class TeamGameStats {
  final TeamStatistics teamStats;

  int fgm;
  int fga;
  double fgpct;
  int ftm;
  int fta;
  double ftpct;
  int tpm;
  int tpa;
  double tppct;
  int points;
  int offRebounds;
  int defRebounds;
  int totalRebounds;
  int assists;
  int steals;
  int blocks;
  int turnovers;
  int personalFouls;
  int teamFouls;
  int fastBreakPoints;
  int pointsInPaint;
  int biggestLead;
  int longestRun;
  int secondChancePoints;
  int pointsOffTurnovers;
  int plusMinus;
  int minutes;

  TeamGameStats({this.teamStats}) {
    var s = teamStats;
    var st = teamStats;
    fgm = st.fieldGoalsMade;
    fga = st.fieldGoalsAttempted;
    ftm = st.freeThrowsMade;
    fta = st.freeThrowsAttempted;
    tpm = st.threePointersMade;
    tpa = st.threePointersAttempted;
    points = st.points;
    offRebounds = st.reboundsOffensive;
    defRebounds = st.reboundsDefensive;
    totalRebounds = st.reboundsTotal;
    assists = st.assists;
    steals = st.steals;
    blocks = st.blocks;
    turnovers = st.turnoversTeam;
    personalFouls = st.foulsPersonal;
    teamFouls = st.foulsTeam;
    fastBreakPoints = s.fastBreakPointsMade;
    pointsInPaint = s.pointsInThePaint;
    biggestLead = s.biggestLead;
    longestRun = s.biggestScoringRun;
    secondChancePoints = s.pointsSecondChance;
    pointsOffTurnovers = s.pointsFromTurnovers;
    //minutes = formatMinutes(st["min"]);
    //plusMinus = st["plusMinus"]);
  }

  int formatMinutes(String m) {
    return int.parse(m.substring(0, m.indexOf(":")));
  }

  double get fgPct {
    return fgm / fga;
  }

  double get ftPct {
    return ftm / fta;
  }

  double get tpPct {
    return tpm / tpa;
  }

  String get ppp {
    double ppp = points / (fga + (0.44 * fta) + turnovers);

    return ppp.toStringAsFixed(2);
  }

  String getORtg() {
    double ortg = 100 * points / (fga + (0.44 * fta) + turnovers);

    return ortg.toStringAsFixed(2);
  }

  String getDRtg(int opponentPoints) {
    double drtg = 100 * opponentPoints / (fga + (0.44 * fta) + turnovers);

    return drtg.toStringAsFixed(2);
  }

  String get tsPct {
    double ts = 100 * 0.5 * points / (fga + (0.44 * fta));

    return ts.toStringAsFixed(1);
  }

  String get efg {
    double efg = 100 * (fgm + (tpm * 0.5)) / fga;

    return efg.toStringAsFixed(1);
  }

  String get tovPct {
    double tovPct = 100 * turnovers / (fga + 0.44 * fta + turnovers);

    return tovPct.toStringAsFixed(1);
  }
}
