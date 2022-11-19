import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_latest.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_preview_article_header.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../../screens/views/games/game_view.dart';

class InProgressGameCardDashboard extends StatelessWidget {
  final dynamic game;
  InProgressGameCardDashboard({this.game});

  @override
  Widget build(BuildContext context) {
    var gameId = game["gameId"];

    DatabaseReference gameHeaderDb =
        FirebaseDatabase.instance.ref('gameHeader22/$gameId');

    return StreamBuilder(
        //future: _gameData,
        stream: gameHeaderDb.onValue,
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
            var game = values["data"];
            final standings = Provider.of<JsonFiles>(context, listen: false)
                .getLeagueStandings(); //["league"]["standard"]["conference"];
            final LeagueStanding vTeam = standings
                .getTeamStandings(game["awayTeam"]["teamId"].toString());
            final LeagueStanding hTeam = standings
                .getTeamStandings(game["homeTeam"]["teamId"].toString());

            int vTeamScore = game["awayTeam"]["score"] == ""
                ? "0"
                : game["awayTeam"]["score"];
            int hTeamScore = game["homeTeam"]["score"] == ""
                ? "0"
                : game["homeTeam"]["score"];
            bool preview = game["isPreviewArticleAvail"];
            var date = game["gameUrlCode"].toString().split("/")[0];

            return Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameView(
                        //game: gameStream,
                        game: game,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      preview != null
                          ? GamePreviewArticleHeader(
                              gameId: gameId, gameDate: date)
                          : SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedLogo(
                              radius: 35,
                              url: ConstantHelper.getTeamLogo(
                                  game["awayTeam"]["teamId"].toString())),
                          Text(
                            "(${vTeam.record})",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Column(children: [
                            Text(
                              vTeamScore.toString() +
                                  " - " +
                                  hTeamScore.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red[600],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              game["gameStatusText"],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.green[800]),
                            ),
                          ]),
                          Text(
                            "(${hTeam.record})",
                            style: TextStyle(color: Colors.grey[700]),
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
}
