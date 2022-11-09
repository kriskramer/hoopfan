import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_latest.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_recap_article_header.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../../screens/views/games/game_view.dart';

class CompletedGameCardDashboard extends StatelessWidget {
  final dynamic game;

  CompletedGameCardDashboard({this.game});

  @override
  Widget build(BuildContext context) {
    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["awayTeam"]["teamId"].toString());
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["homeTeam"]["teamId"].toString());

    bool recap = game["isRecapArticleAvail"];
    var gameId = game["gameId"];
    var date = game["gameUrlCode"].toString().split("/")[0];

    DatabaseReference gameDataDb =
        FirebaseDatabase.instance.ref('gameData22/$gameId');

    bool isOvertime = false;
    if (game["period"] != null) {
      isOvertime = game["period"] > 4 ? true : false;
    }

    bool isHomeWin = isHomeTeamWinner(game);

    return StreamBuilder(
        //future: _gameData,
        stream: gameDataDb.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            //print('reloading game_view data');
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            if (values == null) {
              return Column(children: [
                Text("No data"),
              ]);
            }
            var gameStream = values["data"]["game"];

            return Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameView(
                                game: game,
                                gameData: gameStream,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      recap != null
                          ? GameRecapArticleHeader(
                              gameId: gameId, gameDate: date)
                          : SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedLogo(
                              radius: 35,
                              url: ConstantHelper.getTeamLogo(
                                  game["awayTeam"]["teamId"].toString())),
                          vTeam != null
                              ? Text(
                                  "(${vTeam.record})",
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 16),
                                )
                              : Text(""),
                          Column(children: [
                            Text(
                              formatDate(game["gameEt"].toString())[0],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Row(children: [
                              Text(
                                game["awayTeam"]["score"].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: isHomeWin
                                        ? FontWeight.normal
                                        : FontWeight.bold),
                              ),
                              Text(
                                " - ",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                              Text(
                                game["homeTeam"]["score"].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: isHomeWin
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ]),
                            Text(
                              game["gameStatusText"],
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ]),
                          Text(
                            "(${hTeam.record})",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 16),
                          ),
                          CachedLogo(
                              radius: 35,
                              url: ConstantHelper.getTeamLogo(
                                  game["homeTeam"]["teamId"].toString())),
                        ],
                      ),
                      GameFeedLatest(gameId)
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox();
        });
  }

  bool isHomeTeamWinner(dynamic game) {
    bool isWinner = false;

    int vTeamScore = game["awayTeam"]["score"];
    int hTeamScore = game["homeTeam"]["score"];

    if (hTeamScore > vTeamScore) {
      isWinner = true;
    }

    return isWinner;
  }
}
