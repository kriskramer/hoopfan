import 'apg.dart';
import 'bpg.dart';
import 'drpg.dart';
import "eff.dart";
import "fgp.dart";
import "ftp.dart";
import "min.dart";
import "oppg.dart";
import "orpg.dart";
import "pfpg.dart";
import "ppg.dart";
import "spg.dart";
import "tpg.dart";
import "tpp.dart";
import "trpg.dart";

class TeamStats {
  String teamId;
  String name;
  String nickname;
  String teamcode;
  String abbreviation;
  Min min;
  Fgp fgp;
  Tpp tpp;
  Ftp ftp;
  Orpg orpg;
  Drpg drpg;
  Trpg trpg;
  Apg apg;
  Tpg tpg;
  Spg spg;
  Bpg bpg;
  Pfpg pfpg;
  Ppg ppg;
  Oppg oppg;
  Eff eff;

  TeamStats({
    this.teamId,
    this.name,
    this.nickname,
    this.teamcode,
    this.abbreviation,
    this.min,
    this.fgp,
    this.tpp,
    this.ftp,
    this.orpg,
    this.drpg,
    this.trpg,
    this.apg,
    this.tpg,
    this.spg,
    this.bpg,
    this.pfpg,
    this.ppg,
    this.oppg,
    this.eff,
  });

  factory TeamStats.fromJson(Map<String, dynamic> json) {
    return TeamStats(
      teamId: json['teamId'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      teamcode: json['teamcode'] as String,
      abbreviation: json['abbreviation'] as String,
      min: json['min'] == null
          ? null
          : Min.fromJson(json['min'] as Map<String, dynamic>),
      fgp: json['fgp'] == null
          ? null
          : Fgp.fromJson(json['fgp'] as Map<String, dynamic>),
      tpp: json['tpp'] == null
          ? null
          : Tpp.fromJson(json['tpp'] as Map<String, dynamic>),
      ftp: json['ftp'] == null
          ? null
          : Ftp.fromJson(json['ftp'] as Map<String, dynamic>),
      orpg: json['orpg'] == null
          ? null
          : Orpg.fromJson(json['orpg'] as Map<String, dynamic>),
      drpg: json['drpg'] == null
          ? null
          : Drpg.fromJson(json['drpg'] as Map<String, dynamic>),
      trpg: json['trpg'] == null
          ? null
          : Trpg.fromJson(json['trpg'] as Map<String, dynamic>),
      apg: json['apg'] == null
          ? null
          : Apg.fromJson(json['apg'] as Map<String, dynamic>),
      tpg: json['tpg'] == null
          ? null
          : Tpg.fromJson(json['tpg'] as Map<String, dynamic>),
      spg: json['spg'] == null
          ? null
          : Spg.fromJson(json['spg'] as Map<String, dynamic>),
      bpg: json['bpg'] == null
          ? null
          : Bpg.fromJson(json['bpg'] as Map<String, dynamic>),
      pfpg: json['pfpg'] == null
          ? null
          : Pfpg.fromJson(json['pfpg'] as Map<String, dynamic>),
      ppg: json['ppg'] == null
          ? null
          : Ppg.fromJson(json['ppg'] as Map<String, dynamic>),
      oppg: json['oppg'] == null
          ? null
          : Oppg.fromJson(json['oppg'] as Map<String, dynamic>),
      eff: json['eff'] == null
          ? null
          : Eff.fromJson(json['eff'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamId': teamId,
      'name': name,
      'nickname': nickname,
      'teamcode': teamcode,
      'abbreviation': abbreviation,
      'min': min?.toJson(),
      'fgp': fgp?.toJson(),
      'tpp': tpp?.toJson(),
      'ftp': ftp?.toJson(),
      'orpg': orpg?.toJson(),
      'drpg': drpg?.toJson(),
      'trpg': trpg?.toJson(),
      'apg': apg?.toJson(),
      'tpg': tpg?.toJson(),
      'spg': spg?.toJson(),
      'bpg': bpg?.toJson(),
      'pfpg': pfpg?.toJson(),
      'ppg': ppg?.toJson(),
      'oppg': oppg?.toJson(),
      'eff': eff?.toJson(),
    };
  }

  TeamStats copyWith({
    String teamId,
    String name,
    String nickname,
    String teamcode,
    String abbreviation,
    Min min,
    Fgp fgp,
    Tpp tpp,
    Ftp ftp,
    Orpg orpg,
    Drpg drpg,
    Trpg trpg,
    Apg apg,
    Tpg tpg,
    Spg spg,
    Bpg bpg,
    Pfpg pfpg,
    Ppg ppg,
    Oppg oppg,
    Eff eff,
  }) {
    return TeamStats(
      teamId: teamId ?? this.teamId,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      teamcode: teamcode ?? this.teamcode,
      abbreviation: abbreviation ?? this.abbreviation,
      min: min ?? this.min,
      fgp: fgp ?? this.fgp,
      tpp: tpp ?? this.tpp,
      ftp: ftp ?? this.ftp,
      orpg: orpg ?? this.orpg,
      drpg: drpg ?? this.drpg,
      trpg: trpg ?? this.trpg,
      apg: apg ?? this.apg,
      tpg: tpg ?? this.tpg,
      spg: spg ?? this.spg,
      bpg: bpg ?? this.bpg,
      pfpg: pfpg ?? this.pfpg,
      ppg: ppg ?? this.ppg,
      oppg: oppg ?? this.oppg,
      eff: eff ?? this.eff,
    );
  }
}
