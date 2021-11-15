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

    var width = MediaQuery.of(context).size.width - 20;

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
                          "W %"),
                      TeamSingleStat(
                          'ORtg',
                          teamStats[7].toString(),
                          teamStats[21].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "OFF RTG"),
                      TeamSingleStat(
                          'DRtg',
                          teamStats[8].toString(),
                          teamStats[22].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "DEF RTG"),
                      TeamSingleStat(
                          'Net',
                          teamStats[9].toString(),
                          teamStats[23].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "NET RTG"),
                      TeamSingleStat(
                          'Pace',
                          teamStats[10].toString(),
                          teamStats[29].toString(),
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
                          "AST RATIO"),
                      TeamSingleStat(
                          'Tm Tov %',
                          teamStats[15].toString(),
                          teamStats[28].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "TM TOV %"),
                      TeamSingleStat(
                          'OReb %',
                          teamStats[12].toString(),
                          teamStats[25].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "OREB %"),
                      TeamSingleStat(
                          'DReb %',
                          teamStats[13].toString(),
                          teamStats[26].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "DREB %"),
                      TeamSingleStat(
                          'Reb %',
                          teamStats[14].toString(),
                          teamStats[27].toString(),
                          width,
                          teamId,
                          "ESTIMATED",
                          "REB %"),
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
