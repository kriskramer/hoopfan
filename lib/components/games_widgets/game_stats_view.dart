import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../json/jsons.dart';
import 'game_box_score_main.dart';
import 'game_stats.dart';

class GameStatsView extends StatelessWidget {
  final dynamic gameData;
  final String gameId;

  const GameStatsView(this.gameData, this.gameId);

  @override
  Widget build(BuildContext context) {
    var stats = Provider.of<JsonFiles>(context, listen: false)
        .getCurrentGameStats(gameId);

    return Scaffold(
        appBar: AppBar(
          title: Text("Game Stats"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Stats'),
                      Tab(text: gameData["vTeam"]["triCode"]),
                      Tab(text: gameData["hTeam"]["triCode"]),
                    ],
                  ),
                ),
                Container(
                  height: 1000, //height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: GameStats(
                          stats: stats,
                          gameData: gameData,
                        ),
                      ),
                      Container(
                        child: GameBoxScoreMain(
                          game: gameData,
                          stats: stats,
                          isHomeTeam: false,
                        ),
                      ),
                      Container(
                        child: GameBoxScoreMain(
                          game: gameData,
                          stats: stats,
                          isHomeTeam: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
