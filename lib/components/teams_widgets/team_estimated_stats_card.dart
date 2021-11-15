import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_single_stat.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamEstimatedStatsCard extends StatelessWidget {
  final String teamId;

  TeamEstimatedStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic estimatedStats =
        Provider.of<JsonFiles>(context, listen: false).getEstimatedTeamStats();
    var teamStats = getTeamEstimatedStats(teamId, estimatedStats);

    var width = MediaQuery.of(context).size.width - 35;

    return teamStats == null
        ? Text('No stats available')
        : Container(
            child: Column(children: [
              Container(
                child: Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TeamSingleStat(
                          'W',
                          teamStats[3].toString(),
                          teamStats[17].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "W"),
                      TeamSingleStat(
                          'L',
                          teamStats[4].toString(),
                          teamStats[18].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "L"),
                      TeamSingleStat(
                          'Win %',
                          teamStats[5].toString(),
                          teamStats[19].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "WINPCT"),
                      TeamSingleStat(
                          'ORtg',
                          teamStats[7].toString(),
                          teamStats[20].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "ORTG"),
                      TeamSingleStat(
                          'DRtg',
                          teamStats[8].toString(),
                          teamStats[21].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "DRTG"),
                      TeamSingleStat(
                          'Net',
                          teamStats[9].toString(),
                          teamStats[22].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "NET"),
                      TeamSingleStat(
                          'Pace',
                          teamStats[10].toString(),
                          teamStats[23].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "PACE"),
                      TeamSingleStat(
                          'Ast Ratio',
                          teamStats[11].toString(),
                          teamStats[24].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "ASTRATIO"),
                      TeamSingleStat(
                          'TO %',
                          teamStats[15].toString(),
                          teamStats[25].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "TOPCT"),
                      TeamSingleStat(
                          'OReb %',
                          teamStats[12].toString(),
                          teamStats[26].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "OREBPCT"),
                      TeamSingleStat(
                          'DReb %',
                          teamStats[13].toString(),
                          teamStats[27].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "DREBPCT"),
                      TeamSingleStat(
                          'Reb %',
                          teamStats[14].toString(),
                          teamStats[28].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "REBPCT"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ]),
              ),
            ]),
          );
  }

  dynamic getTeamEstimatedStats(String teamId, dynamic stats) {
    dynamic team;
    for (var t in stats["resultSet"]["rowSet"]) {
      if (t[1].toString() == teamId) {
        team = t;
      }
    }

    return team;
  }
}
