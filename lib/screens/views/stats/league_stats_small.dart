import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/advanced_stats_league.dart';
import 'package:hoop/models/base_stats_league.dart';
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

    print("a");
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("PTS"),
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
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text("FG %"),
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
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
