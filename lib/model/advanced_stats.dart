class AdvancedStats {
  final dynamic stats;

  TeamStats vTeam;
  TeamStats hTeam;

  AdvancedStats({this.stats}) {
    this.vTeam = TeamStats(teamStats: stats["vTeam"]);
    this.hTeam = TeamStats(teamStats: stats["hTeam"]);
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

class TeamStats {
  final dynamic teamStats;

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

  TeamStats({this.teamStats}) {
    var s = teamStats;
    var st = teamStats["totals"];
    fgm = int.parse(st["fgm"]);
    fga = int.parse(st["fga"]);
    ftm = int.parse(st["ftm"]);
    fta = int.parse(st["fta"]);
    tpm = int.parse(st["tpm"]);
    tpa = int.parse(st["tpa"]);
    points = int.parse(st["points"]);
    offRebounds = int.parse(st["offReb"]);
    defRebounds = int.parse(st["defReb"]);
    totalRebounds = int.parse(st["totReb"]);
    assists = int.parse(st["assists"]);
    steals = int.parse(st["steals"]);
    blocks = int.parse(st["blocks"]);
    turnovers = int.parse(st["turnovers"]);
    personalFouls = int.parse(st["pFouls"]);
    teamFouls = int.parse(st["team_fouls"]);
    fastBreakPoints = int.parse(s["fastBreakPoints"]);
    pointsInPaint = int.parse(s["pointsInPaint"]);
    biggestLead = int.parse(s["biggestLead"]);
    longestRun = int.parse(s["longestRun"]);
    secondChancePoints = int.parse(s["secondChancePoints"]);
    pointsOffTurnovers = int.parse(s["pointsOffTurnovers"]);
    minutes = formatMinutes(st["min"]);
    plusMinus = int.parse(st["plusMinus"]);
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
    double efg = fgm + (tpm * 0.5) / fga;

    return efg.toStringAsFixed(1);
  }

  String get tovPct {
    double tovPct = 100 * turnovers / (fga + 0.44 * fta + turnovers);

    return tovPct.toStringAsFixed(1);
  }
}
