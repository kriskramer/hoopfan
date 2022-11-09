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

    DatabaseReference gameDataDb =
        FirebaseDatabase.instance.ref('gameData22/$gameId');

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
            final standings = Provider.of<JsonFiles>(context, listen: false)
                .getLeagueStandings(); //["league"]["standard"]["conference"];
            final LeagueStanding vTeam = standings
                .getTeamStandings(gameStream["awayTeam"]["teamId"].toString());
            final LeagueStanding hTeam = standings
                .getTeamStandings(gameStream["homeTeam"]["teamId"].toString());

            int vTeamScore = gameStream["awayTeam"]["score"] == ""
                ? "0"
                : gameStream["awayTeam"]["score"];
            int hTeamScore = gameStream["homeTeam"]["score"] == ""
                ? "0"
                : gameStream["homeTeam"]["score"];
            bool preview = gameStream["isPreviewArticleAvail"];
            var date = gameStream["gameUrlCode"].toString().split("/")[0];

            return Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameView(
                        game: gameStream,
                        gameData: game,
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
                                  gameStream["awayTeam"]["teamId"].toString())),
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
                              gameStream["gameStatusText"],
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
                                  gameStream["homeTeam"]["teamId"].toString())),
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

  String getCurrentPeriod(dynamic json) {
    return json["gameStatusText"];
    // var period = json["period"];
    // var periodString = "";
    // var clock = json["clock"];
    // var isHalftime = json["period"]["isHalftime"];
    // var clockString = "";

    // if (period == 1) {
    //   periodString = "1st";
    // } else if (period == 2) {
    //   periodString = "2nd";
    // } else if (period == 3) {
    //   periodString = "3rd";
    // } else if (period == 4) {
    //   periodString = "4th";
    // } else if (period > 4) {
    //   periodString = "OT";
    // }

    // if (isHalftime) {
    //   clockString = "Halftime";
    // } else {
    //   clockString = periodString + "  " + clock;
    // }

    // return clockString;
  }

  // dynamic getVTeamStandingsFromJson(dynamic game, dynamic json) {
  //   dynamic team;
  //   String teamId = game["awayTeam"]["teamId"];

  //   for (var t in json["east"]) {
  //     if (t["teamId"] == teamId) {
  //       team = t;
  //       break;
  //     }
  //   }
  //   for (var t in json["west"]) {
  //     if (t["teamId"] == teamId) {
  //       team = t;
  //       break;
  //     }
  //   }

  //   return team;
  // }

  // dynamic getHTeamStandingsFromJson(dynamic game, dynamic json) {
  //   dynamic team;
  //   String teamId = game["homeTeam"]["teamId"];

  //   for (var t in json["east"]) {
  //     if (t["teamId"] == teamId) {
  //       team = t;
  //       break;
  //     }
  //   }
  //   for (var t in json["west"]) {
  //     if (t["teamId"] == teamId) {
  //       team = t;
  //       break;
  //     }
  //   }

  //   return team;
  // }

  String getHowToWatch() {
    String howToWatch = "";
    String nat, v, h;

    if (game["watch"]["broadcast"]["broadcasters"]["national"].length > 0) {
      nat = game["watch"]["broadcast"]["broadcasters"]["national"][0]
          ["shortName"];
    } else {
      nat = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["homeTeam"].length > 0) {
      h = game["watch"]["broadcast"]["broadcasters"]["homeTeam"][0]
          ["shortName"];
    } else {
      h = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["awayTeam"].length > 0) {
      v = game["watch"]["broadcast"]["broadcasters"]["awayTeam"][0]
          ["shortName"];
    } else {
      v = "";
    }

    howToWatch = "$nat  $v  $h";

    return howToWatch;
  }
}
