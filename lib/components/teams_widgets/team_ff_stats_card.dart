import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_single_stat.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamFourFactorsStatsCard extends StatelessWidget {
  final String teamId;

  TeamFourFactorsStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic stats = Provider.of<JsonFiles>(context, listen: false)
        .getFourFactorsTeamStats();
    var teamStats = getTeamStats(teamId, stats);

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
                      Text('Team'),
                      TeamSingleStat('Eff FG %', teamStats[7].toString(),
                          teamStats[20].toString(), width),
                      TeamSingleStat('FTA Rate', teamStats[8].toString(),
                          teamStats[21].toString(), width),
                      TeamSingleStat('Tm TO %', teamStats[9].toString(),
                          teamStats[22].toString(), width),
                      TeamSingleStat('OReb %', teamStats[10].toString(),
                          teamStats[23].toString(), width),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Opponent'),
                      TeamSingleStat('Eff FG %', teamStats[11].toString(),
                          teamStats[24].toString(), width),
                      TeamSingleStat('FTA Rate', teamStats[12].toString(),
                          teamStats[25].toString(), width),
                      TeamSingleStat('TO %', teamStats[13].toString(),
                          teamStats[26].toString(), width),
                      TeamSingleStat('OReb %', teamStats[14].toString(),
                          teamStats[27].toString(), width),
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
