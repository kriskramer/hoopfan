class LeagueStanding {
  var leagueID;
  var seasonID;
  var teamID;
  var teamCity;
  var teamName;
  var teamSlug;
  var conference;
  var conferenceRecord;
  var playoffRank;
  var clinchIndicator;
  var division;
  var divisionRecord;
  var divisionRank;
  var win;
  var wins;
  var loss;
  var losses;
  var winPct;
  var leagueRank;
  var record;
  var home;
  var road;
  var l10;
  var last10Home;
  var last10Road;
  var ot;
  var threePTSOrLess;
  var tenPTSOrMore;
  var longHomeStreak;
  var strLongHomeStreak;
  var longRoadStreak;
  var strLongRoadStreak;
  var longWinStreak;
  var longLossStreak;
  var currentHomeStreak;
  var strCurrentHomeStreak;
  var currentRoadStreak;
  var strCurrentRoadStreak;
  var currentStreak;
  var strCurrentStreak;
  var conferenceGamesBack;
  var divisionGamesBack;
  var clinchedConferenceTitle;
  var clinchedDivisionTitle;
  var clinchedPlayoffBirth;
  var eliminatedConference;
  var eliminatedDivision;
  var aheadAtHalf;
  var behindAtHalf;
  var tiedAtHalf;
  var aheadAtThird;
  var behindAtThird;
  var tiedAtThird;
  var score100PTS;
  var oppScore100PTS;
  var oppOver500;
  var leadInFGPCT;
  var leadInReb;
  var fewerTurnovers;
  var pointsPG;
  var oppPointsPG;
  var diffPointsPG;
  var vsEast;
  var vsAtlantic;
  var vsCentral;
  var vsSoutheast;
  var vsWest;
  var vsNorthwest;
  var vsPacific;
  var vsSouthwest;
  var jan;
  var feb;
  var mar;
  var apr;
  var may;
  var jun;
  var jul;
  var aug;
  var sep;
  var oct;
  var nov;
  var dec;

  LeagueStanding(dynamic json) {
    leagueID = json[0];
    seasonID = json[1];
    teamID = json[2];
    teamCity = json[3];
    teamName = json[4];
    teamSlug = json[5];
    conference = json[6];
    conferenceRecord = json[7];
    playoffRank = json[8];
    clinchIndicator = json[9];
    division = json[10];
    divisionRecord = json[11];
    divisionRank = json[12];
    wins = json[13];
    losses = json[14];
    winPct = json[15];
    leagueRank = json[16];
    record = json[17];
    home = json[18];
    road = json[19];
    l10 = json[20];
    last10Home = json[21];
    last10Road = json[22];
    ot = json[23];
    threePTSOrLess = json[24];
    tenPTSOrMore = json[25];
    longHomeStreak = json[26];
    strLongHomeStreak = json[27];
    longRoadStreak = json[28];
    strLongRoadStreak = json[29];
    longWinStreak = json[30];
    longLossStreak = json[31];
    currentHomeStreak = json[32];
    strCurrentHomeStreak = json[33];
    currentRoadStreak = json[34];
    strCurrentRoadStreak = json[35];
    currentStreak = json[36];
    strCurrentStreak = json[37];
    conferenceGamesBack = json[38];
    divisionGamesBack = json[39];
    clinchedConferenceTitle = json[40];
    clinchedDivisionTitle = json[41];
    clinchedPlayoffBirth = json[42];
    eliminatedConference = json[43];
    eliminatedDivision = json[44];
    aheadAtHalf = json[45];
    behindAtHalf = json[46];
    tiedAtHalf = json[47];
    aheadAtThird = json[48];
    behindAtThird = json[49];
    tiedAtThird = json[50];
    score100PTS = json[51];
    oppScore100PTS = json[52];
    oppOver500 = json[53];
    leadInFGPCT = json[54];
    leadInReb = json[55];
    fewerTurnovers = json[56];
    pointsPG = json[57];
    oppPointsPG = json[58];
    diffPointsPG = json[59];
    vsEast = json[60];
    vsAtlantic = json[61];
    vsCentral = json[62];
    vsSoutheast = json[63];
    vsWest = json[64];
    vsNorthwest = json[65];
    vsPacific = json[66];
    vsSouthwest = json[67];
    jan = json[68];
    feb = json[69];
    mar = json[70];
    apr = json[71];
    may = json[72];
    jun = json[73];
    jul = json[74];
    aug = json[75];
    sep = json[76];
    oct = json[77];
    nov = json[78];
    dec = json[79];
  }
}

class LeagueStandingList {
  List<LeagueStanding> items = [];

  LeagueStandingList(dynamic json) {
    for (var s in json["resultSets"][0]["rowSet"]) {
      items.add(LeagueStanding(s));
    }
  }

  LeagueStanding getTeamStandings(String teamId) {
    for (var t in items) {
      if (t.teamID.toString() == teamId) {
        return t;
      }
    }

    return null;
  }

  List<LeagueStanding> getConferenceStandings(String conf) {
    List<LeagueStanding> list = [];

    for (var t in items) {
      if (t.conference == conf) {
        list.add(t);
      }
    }

    list.sort((a, b) {
      if (a.winPct > b.winPct) {
        return -1;
      } else {
        return 1;
      }
    });

    return list;
  }

  List<LeagueStanding> getDivisionStandings(String division) {
    List<LeagueStanding> list = [];

    for (var t in items) {
      if (t.division == division) {
        list.add(t);
      }
    }

    list.sort((a, b) {
      if (a.divisionRank > b.divisionRank) {
        return 1;
      } else {
        return -1;
      }
    });

    return list;
  }

  List<LeagueStanding> getLeagueStandings() {
    List<LeagueStanding> list = [];

    for (var t in items) {
      list.add(t);
    }

    list.sort((a, b) {
      // add null check
      if (a.leagueRank == null || b.leagueRank == null) {
        a.leagueRank = 0;
        b.leagueRank = 0;
      }
      if (a.winPct < b.winPct) {
        return 1;
      } else {
        return -1;
      }
    });

    return list;
  }
}
