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
                      TeamSingleStat('ORtg', teamStats[8].toString(),
                          teamStats[32].toString(), width),
                      TeamSingleStat('DRtg', teamStats[10].toString(),
                          teamStats[33].toString(), width),
                      TeamSingleStat('Net', teamStats[12].toString(),
                          teamStats[34].toString(), width),
                      TeamSingleStat('Ast %', teamStats[13].toString(),
                          teamStats[35].toString(), width),
                      TeamSingleStat('Ast/TO', teamStats[14].toString(),
                          teamStats[36].toString(), width),
                      TeamSingleStat('Ast Ratio', teamStats[15].toString(),
                          teamStats[37].toString(), width),
                      TeamSingleStat('OReb %', teamStats[16].toString(),
                          teamStats[38].toString(), width),
                      TeamSingleStat('DReb %', teamStats[17].toString(),
                          teamStats[39].toString(), width),
                      TeamSingleStat('Reb %', teamStats[18].toString(),
                          teamStats[40].toString(), width),
                      TeamSingleStat('Tm TO %', teamStats[19].toString(),
                          teamStats[41].toString(), width),
                      TeamSingleStat('Eff FG %', teamStats[20].toString(),
                          teamStats[42].toString(), width),
                      TeamSingleStat('TS %', teamStats[21].toString(),
                          teamStats[43].toString(), width),
                      TeamSingleStat(
                          'Est Pace', teamStats[22].toString(), '', width),
                      TeamSingleStat('Pace', teamStats[23].toString(),
                          teamStats[44].toString(), width),
                      TeamSingleStat(
                          'Pace/40', teamStats[24].toString(), '', width),
                      TeamSingleStat(
                          'Poss', teamStats[25].toString(), '', width),
                      TeamSingleStat('Pie', teamStats[26].toString(),
                          teamStats[45].toString(), width),
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
