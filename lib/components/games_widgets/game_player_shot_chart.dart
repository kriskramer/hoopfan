import 'package:flutter/material.dart';
import 'package:hoop/models/shot_chart.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GamePlayerShotChart extends StatelessWidget {
  final playerId;
  final teamId;
  final gameId;

  const GamePlayerShotChart(this.playerId, this.teamId, this.gameId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic player = snapshot.data["resultSets"][0]["rowSet"];
          dynamic league = snapshot.data["resultSets"][1]["rowSet"];

          PlayerShotChartList listPlayer = PlayerShotChartList(player);
          //PlayerShotChartList listLeague = PlayerShotChartList(league);

          return Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(width: 1, color: Colors.grey[400]))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "2",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ));
        } else
          return SizedBox();
      },
    );
  }

  Future<void> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsPlayerShotChart(playerId, teamId, gameId),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }
}
