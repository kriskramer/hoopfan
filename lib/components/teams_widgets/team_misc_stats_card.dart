import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_single_stat.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamMiscStatsCard extends StatelessWidget {
  final String teamId;

  TeamMiscStatsCard({this.teamId});

  @override
  Widget build(BuildContext context) {
    dynamic stats =
        Provider.of<JsonFiles>(context, listen: false).getMiscTeamStats();
    var teamStats = getTeamStats(teamId, stats);

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
                      Text('Team'),
                      TeamSingleStat(
                          'Pts off TOs',
                          teamStats[7].toString(),
                          teamStats[20].toString(),
                          width,
                          teamId,
                          "MISC",
                          "PTS OFF TOS"),
                      TeamSingleStat(
                          '2nd Chance Pts',
                          teamStats[8].toString(),
                          teamStats[21].toString(),
                          width,
                          teamId,
                          "MISC",
                          "2ND CHANCE PTS"),
                      TeamSingleStat(
                          'FB Pts',
                          teamStats[9].toString(),
                          teamStats[22].toString(),
                          width,
                          teamId,
                          "MISC",
                          "FB PTS"),
                      TeamSingleStat(
                          'Pts in Paint',
                          teamStats[10].toString(),
                          teamStats[23].toString(),
                          width,
                          teamId,
                          "MISC",
                          "PTS IN PAINT"),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Opponent'),
                      TeamSingleStat(
                          'Opp Pts off TOs',
                          teamStats[11].toString(),
                          teamStats[24].toString(),
                          width,
                          teamId,
                          "MISC",
                          "OPP PTS OFF TOS"),
                      TeamSingleStat(
                          'Opp 2nd Chance Pts',
                          teamStats[12].toString(),
                          teamStats[25].toString(),
                          width,
                          teamId,
                          "MISC",
                          "OPP 2ND CHANCE PTS"),
                      TeamSingleStat(
                          'Opp FB Pts',
                          teamStats[13].toString(),
                          teamStats[26].toString(),
                          width,
                          teamId,
                          "MISC",
                          "OPP FB PTS"),
                      TeamSingleStat(
                          'Opp Pts in Paint',
                          teamStats[14].toString(),
                          teamStats[27].toString(),
                          width,
                          teamId,
                          "MISC",
                          "OPP PTS IN PAINT"),
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
