import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_stats/advanced_stats_league.dart';
import 'package:hoop/models/league_stats/base_stats_league.dart';
import 'package:provider/provider.dart';

class LeagueStatsSmall extends StatelessWidget {
  const LeagueStatsSmall();

  @override
  Widget build(BuildContext context) {
    dynamic baseStatsJson =
        Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats();
    dynamic advancedStatsJson =
        Provider.of<JsonFiles>(context, listen: false).getAdvancedTeamStats();

    BaseStatsLeagueList baseStats = BaseStatsLeagueList(baseStatsJson);
    AdvancedStatsLeagueList advancedStats =
        AdvancedStatsLeagueList(advancedStatsJson);

    //print("a");
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  getStatHeader("FG %"),
                  Text(
                    baseStats.getTopFGPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    baseStats.getAvgFGPct(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    baseStats.getBottomFGPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getStatHeader("PTS"),
                  Text(
                    baseStats.getTopPoints(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    baseStats.getAvgPoints(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    baseStats.getBottomPoints(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Column(
                children: [
                  getStatHeader("eFG %"),
                  Text(
                    advancedStats.getTopEFgPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    advancedStats.getAvgEFgPct(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    advancedStats.getBottomEFgPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getStatHeader("ORtg"),
                  Text(
                    advancedStats.getTopORtg(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    advancedStats.getAvgORtg(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    advancedStats.getBottomORtg(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Column(
                children: [
                  getStatHeader("TS %"),
                  Text(
                    advancedStats.getTopTSPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    advancedStats.getAvgTSPct(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    advancedStats.getBottomTSPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getStatHeader("DRtg"),
                  Text(
                    advancedStats.getTopDRtg(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    advancedStats.getAvgDRtg(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    advancedStats.getBottomDRtg(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Column(
                children: [
                  getStatHeader("3P %"),
                  Text(
                    baseStats.getTop3PPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    baseStats.getAvg3PPct(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    baseStats.getBottom3PPct(),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getStatHeader("Pace"),
                  Text(
                    advancedStats.getTopPace(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    advancedStats.getAvgPace(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    advancedStats.getBottomPace(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getStatHeader(String headerText) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      width: 40,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Center(
        child: Text(
          headerText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900]),
        ),
      ),
    );
  }
}
