import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/arena_card.dart';
import 'package:hoop/components/games_widgets/game_officials.dart';
import 'package:hoop/components/games_widgets/game_video_feed.dart';
import 'package:hoop/components/games_widgets/how_to_watch_card.dart';
import 'package:hoop/components/games_widgets/on_court_card.dart';
import 'package:hoop/models/game_data.dart';
import 'package:provider/provider.dart';

import '../../json/jsons.dart';
import 'game_box_score_main.dart';
import 'game_stats.dart';

class GameStatsView extends StatelessWidget {
  final dynamic gameData;
  final String gameId;
  final GameData game;

  const GameStatsView(this.gameData, this.gameId, this.game);

  @override
  Widget build(BuildContext context) {
    var stats = Provider.of<JsonFiles>(context, listen: false)
        .getCurrentGameStats(gameId);
    var gameStatus = gameData["gameStatus"];

    return Scaffold(
        appBar: AppBar(
          title: Text("Game Stats"),
        ),
        body: SingleChildScrollView(
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
                      Tab(text: 'Game'),
                      Tab(text: 'Stats'),
                      Tab(text: gameData["awayTeam"]["teamTricode"]),
                      Tab(text: gameData["homeTeam"]["teamTricode"]),
                      Tab(
                        text: 'Video',
                      )
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
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: OnCourtCard(
                              game: game,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ArenaCard(
                            game: game,
                          ),
                          GameOfficials(
                            game: game,
                          ),
                          gameStatus < 3
                              ? HowToWatchCard(game: gameData)
                              : Text(''),
                          gameStatus < 3 ? getTicketsCard(context) : Text('')
                        ],
                      ),
                      Container(
                        child: GameStats(
                          game: game,
                        ),
                      ),
                      Container(
                        child: GameBoxScoreMain(
                          game: game,
                          isHomeTeam: false,
                        ),
                      ),
                      Container(
                        child: GameBoxScoreMain(
                          game: game,
                          isHomeTeam: true,
                        ),
                      ),
                      Container(
                        child: GameVideoFeed(gameId),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget getTicketsCard(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("GET TICKETS", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: Text(
                  //widget.game["tickets"]["mobileApp"],
                  'Coming Soon',
                  style: TextStyle(fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }
}
