import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_latest.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_preview_article_header.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/utils/formatdate.dart';

import '../../../screens/views/games/game_view.dart';

class UpcomingGameCardDashboard extends StatelessWidget {
  final dynamic game;
  UpcomingGameCardDashboard({this.game});

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
                              radius: 30,
                              url: ConstantHelper.getTeamLogo(
                                  game["awayTeam"]["teamId"].toString())),
                          Text(
                            "(${vTeam.record})",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14),
                          ),
                          Column(children: [
                            Text(
                              formatDate(game["gameTimeUTC"].toString())[0],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              formatDate(game["gameTimeUTC"].toString())[1],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            getStartCountdown(game)
                          ]),
                          Text(
                            "(${hTeam.record})",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14),
                          ),
                          CachedLogo(
                              radius: 30,
                              url: ConstantHelper.getTeamLogo(
                                  game["homeTeam"]["teamId"].toString())),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox();
        });
  }

  Widget getStartCountdown(dynamic game) {
    String startTimeUTC = game["gameTimeUTC"];

    if (startTimeUTC == "") {
      return SizedBox();
    }

    DateTime start = DateTime.parse(startTimeUTC);

    Duration duration = start.difference(DateTime.now());

    Text t;

    if (duration.inMinutes < 91 && duration.inMinutes > 0) {
      t = new Text(
        "${duration.inMinutes.toString()} min to go!",
        style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
      );
    } else if (duration.inMinutes < 1) {
      t = new Text(
        "Starting...",
        style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
      );
    }

    return Container(padding: EdgeInsets.all(4), child: t);
  }
}
