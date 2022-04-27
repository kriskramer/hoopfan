import 'package:flutter/material.dart';

import 'game_box_score_main.dart';
import 'game_stats.dart';

class GameStatsPopup extends StatelessWidget {
  final dynamic gameData;
  final dynamic stats;

  const GameStatsPopup(this.gameData, this.stats);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: DefaultTabController(
            length: 5, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: gameData["vTeam"]["triCode"]),
                      Tab(text: gameData["hTeam"]["triCode"]),
                      Tab(text: 'Stats'),
                    ],
                  ),
                ),
                Container(
                  height: 1300, //height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                    children: <Widget>[
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
                      Container(
                        child: GameStats(
                          stats: stats,
                          gameData: gameData,
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
