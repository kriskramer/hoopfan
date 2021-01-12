class PlayerBoxScore {
  String personId;
  String firstName;
  String lastName;
  String jersey;
  String teamId;
  bool isOnCourt;
  String points;
  String pos;
  String positionFull;
  String playerCode;
  String min;
  String fgm;
  String fga;
  String fgp;
  String ftm;
  String fta;
  String ftp;
  String tpm;
  String tpa;
  String tpp;
  String offReb;
  String defReb;
  String totReb;
  String assists;
  String pFouls;
  String steals;
  String turnovers;
  String blocks;
  String plusMinus;
  String dnp;

  PlayerBoxScore({
    this.personId,
    this.firstName,
    this.lastName,
    this.jersey,
    this.teamId,
    this.isOnCourt,
    this.points,
    this.pos,
    this.positionFull,
    this.playerCode,
    this.min,
    this.fgm,
    this.fga,
    this.fgp,
    this.ftm,
    this.fta,
    this.ftp,
    this.tpm,
    this.tpa,
    this.tpp,
    this.offReb,
    this.defReb,
    this.totReb,
    this.assists,
    this.pFouls,
    this.steals,
    this.turnovers,
    this.blocks,
    this.plusMinus,
    this.dnp,
  });

  factory PlayerBoxScore.fromJson(Map<String, dynamic> json) {
    return PlayerBoxScore(
      personId: json['personId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      jersey: json['jersey'] as String,
      teamId: json['teamId'] as String,
      isOnCourt: json['isOnCourt'] as bool,
      points: json['points'] as String,
      pos: json['pos'] as String,
      positionFull: json['position_full'] as String,
      playerCode: json['player_code'] as String,
      min: json['min'] as String,
      fgm: json['fgm'] as String,
      fga: json['fga'] as String,
      fgp: json['fgp'] as String,
      ftm: json['ftm'] as String,
      fta: json['fta'] as String,
      ftp: json['ftp'] as String,
      tpm: json['tpm'] as String,
      tpa: json['tpa'] as String,
      tpp: json['tpp'] as String,
      offReb: json['offReb'] as String,
      defReb: json['defReb'] as String,
      totReb: json['totReb'] as String,
      assists: json['assists'] as String,
      pFouls: json['pFouls'] as String,
      steals: json['steals'] as String,
      turnovers: json['turnovers'] as String,
      blocks: json['blocks'] as String,
      plusMinus: json['plusMinus'] as String,
      dnp: json['dnp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personId': personId,
      'firstName': firstName,
      'lastName': lastName,
      'jersey': jersey,
      'teamId': teamId,
      'isOnCourt': isOnCourt,
      'points': points,
      'pos': pos,
      'position_full': positionFull,
      'player_code': playerCode,
      'min': min,
      'fgm': fgm,
      'fga': fga,
      'fgp': fgp,
      'ftm': ftm,
      'fta': fta,
      'ftp': ftp,
      'tpm': tpm,
      'tpa': tpa,
      'tpp': tpp,
      'offReb': offReb,
      'defReb': defReb,
      'totReb': totReb,
      'assists': assists,
      'pFouls': pFouls,
      'steals': steals,
      'turnovers': turnovers,
      'blocks': blocks,
      'plusMinus': plusMinus,
      'dnp': dnp,
    };
  }

  PlayerBoxScore copyWith({
    String personId,
    String firstName,
    String lastName,
    String jersey,
    String teamId,
    bool isOnCourt,
    String points,
    String pos,
    String positionFull,
    String playerCode,
    String min,
    String fgm,
    String fga,
    String fgp,
    String ftm,
    String fta,
    String ftp,
    String tpm,
    String tpa,
    String tpp,
    String offReb,
    String defReb,
    String totReb,
    String assists,
    String pFouls,
    String steals,
    String turnovers,
    String blocks,
    String plusMinus,
    String dnp,
  }) {
    return PlayerBoxScore(
      personId: personId ?? this.personId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      jersey: jersey ?? this.jersey,
      teamId: teamId ?? this.teamId,
      isOnCourt: isOnCourt ?? this.isOnCourt,
      points: points ?? this.points,
      pos: pos ?? this.pos,
      positionFull: positionFull ?? this.positionFull,
      playerCode: playerCode ?? this.playerCode,
      min: min ?? this.min,
      fgm: fgm ?? this.fgm,
      fga: fga ?? this.fga,
      fgp: fgp ?? this.fgp,
      ftm: ftm ?? this.ftm,
      fta: fta ?? this.fta,
      ftp: ftp ?? this.ftp,
      tpm: tpm ?? this.tpm,
      tpa: tpa ?? this.tpa,
      tpp: tpp ?? this.tpp,
      offReb: offReb ?? this.offReb,
      defReb: defReb ?? this.defReb,
      totReb: totReb ?? this.totReb,
      assists: assists ?? this.assists,
      pFouls: pFouls ?? this.pFouls,
      steals: steals ?? this.steals,
      turnovers: turnovers ?? this.turnovers,
      blocks: blocks ?? this.blocks,
      plusMinus: plusMinus ?? this.plusMinus,
      dnp: dnp ?? this.dnp,
    );
  }
}

class PlayerBoxScoreList {
  List<PlayerBoxScore> items = List<PlayerBoxScore>();

  void sortByPoints(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (int.parse(b.points == "" ? "0" : b.points) <
            int.parse(a.points == "" ? "0" : a.points))
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (int.parse(b.points == "" ? "0" : b.points) >
            int.parse(a.points == "" ? "0" : a.points))
          return 1;
        else
          return -1;
      });
    }
  }

  void sortByRebounds(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (int.parse(b.totReb == "" ? "0" : b.totReb) <
            int.parse(a.totReb == "" ? "0" : a.totReb))
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (int.parse(b.totReb == "" ? "0" : b.totReb) >
            int.parse(a.totReb == "" ? "0" : a.totReb))
          return 1;
        else
          return -1;
      });
    }
  }

  void sortByAssists(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (int.parse(b.assists == "" ? "0" : b.assists) <
            int.parse(a.assists == "" ? "0" : a.assists))
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (int.parse(b.assists == "" ? "0" : b.assists) >
            int.parse(a.assists == "" ? "0" : a.assists))
          return 1;
        else
          return -1;
      });
    }
  }

  void sortByPlusMinus(bool asc) {
    if (asc) {
      items.sort((a, b) {
        if (int.parse(b.plusMinus == "" ? "0" : b.plusMinus) <
            int.parse(a.plusMinus == "" ? "0" : a.plusMinus))
          return 1;
        else
          return -1;
      });
    } else {
      items.sort((a, b) {
        if (int.parse(b.plusMinus == "" ? "0" : b.plusMinus) >
            int.parse(a.plusMinus == "" ? "0" : a.plusMinus))
          return 1;
        else
          return -1;
      });
    }
  }
}
