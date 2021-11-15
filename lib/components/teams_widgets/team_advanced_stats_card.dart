import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_single_stat.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamAdvancedStatsCard extends StatelessWidget {
  final String teamId;

  TeamAdvancedStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic advancedStats =
        Provider.of<JsonFiles>(context, listen: false).getAdvancedTeamStats();
    var teamStats = getTeamStats(teamId, advancedStats);

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
                          'Off Rtg',
                          teamStats[8].toString(),
                          teamStats[32].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "ORTG"),
                      TeamSingleStat(
                          'Def Rtg',
                          teamStats[10].toString(),
                          teamStats[33].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "DRTG"),
                      TeamSingleStat(
                          'Net Rtg',
                          teamStats[12].toString(),
                          teamStats[34].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "NET"),
                      TeamSingleStat(
                          'Ast %',
                          teamStats[13].toString(),
                          teamStats[35].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "AST %"),
                      TeamSingleStat(
                          'Ast/TO',
                          teamStats[14].toString(),
                          teamStats[36].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "AST/TO"),
                      TeamSingleStat(
                          'Ast Ratio',
                          teamStats[15].toString(),
                          teamStats[37].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "AST RATIO"),
                      TeamSingleStat(
                          'OReb %',
                          teamStats[16].toString(),
                          teamStats[38].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "OREB %"),
                      TeamSingleStat(
                          'DReb %',
                          teamStats[17].toString(),
                          teamStats[39].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "DREB %"),
                      TeamSingleStat(
                          'Reb %',
                          teamStats[18].toString(),
                          teamStats[40].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "REB %"),
                      TeamSingleStat(
                          'Tm TO %',
                          teamStats[19].toString(),
                          teamStats[41].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "TM TOV %"),
                      TeamSingleStat(
                          'Eff FG %',
                          teamStats[20].toString(),
                          teamStats[42].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "EFG %"),
                      TeamSingleStat(
                          'TS %',
                          teamStats[21].toString(),
                          teamStats[43].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "TS %"),
                      TeamSingleStat('Est Pace', teamStats[22].toString(), '',
                          width, teamId, "ADVANCED", "Est Pace"),
                      TeamSingleStat(
                          'Pace',
                          teamStats[23].toString(),
                          teamStats[44].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "PACE"),
                      TeamSingleStat('Pace/40', teamStats[24].toString(), '',
                          width, teamId, "ADVANCED", "Pace/40"),
                      TeamSingleStat('Poss', teamStats[25].toString(), '',
                          width, teamId, "ADVANCED", "POSS"),
                      TeamSingleStat(
                          'Pie',
                          teamStats[26].toString(),
                          teamStats[45].toString(),
                          width,
                          teamId,
                          "ADVANCED",
                          "PIE"),
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

  dynamic getTeamStats(String teamId, dynamic stats) {
    dynamic team;
    for (var t in stats["resultSets"][0]["rowSet"]) {
      if (t[0].toString() == teamId) {
        team = t;
      }
    }

    return team;
  }
}
