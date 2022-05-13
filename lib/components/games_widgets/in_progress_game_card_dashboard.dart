import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_latest.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_preview_article_header.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../screens/views/games/game_feed_view.dart';

class InProgressGameCardDashboard extends StatelessWidget {
  final dynamic game;
  InProgressGameCardDashboard({this.game});

  @override
  Widget build(BuildContext context) {
    var gameId = game["gameId"];
    DatabaseReference gameDataDb =
        FirebaseDatabase.instance.ref('gameData/$gameId');

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
            var gameStream = values["data"]["basicGameData"];
            final standings = Provider.of<JsonFiles>(context, listen: false)
                .getLeagueStandings(); //["league"]["standard"]["conference"];
            final LeagueStanding vTeam =
                standings.getTeamStandings(gameStream["vTeam"]["teamId"]);
            final LeagueStanding hTeam =
                standings.getTeamStandings(gameStream["hTeam"]["teamId"]);

            String vTeamScore = gameStream["vTeam"]["score"] == ""
                ? "0"
                : gameStream["vTeam"]["score"];
            String hTeamScore = gameStream["hTeam"]["score"] == ""
                ? "0"
                : gameStream["hTeam"]["score"];
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
                      builder: (context) => GameFeedView(
                        game: gameStream,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      preview
                          ? GamePreviewArticleHeader(
                              gameId: gameId, gameDate: date)
                          : SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedLogo(
                              radius: 35,
                              url: ConstantHelper.getTeamLogo(
                                  gameStream["vTeam"]["teamId"])),
                          Text(
                            "(${vTeam.wins}-${vTeam.losses})",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Column(children: [
                            Text(
                              vTeamScore + " - " + hTeamScore,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red[600],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              getCurrentPeriod(game),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.green[800]),
                            ),
                          ]),
                          Text(
                            "(${hTeam.wins}-${hTeam.losses})",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          CachedLogo(
                              radius: 35,
                              url: ConstantHelper.getTeamLogo(
                                  gameStream["hTeam"]["teamId"])),
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
    var period = json["period"]["current"];
    var periodString = "";
    var clock = json["clock"];
    var isHalftime = json["period"]["isHalftime"];
    var clockString = "";

    if (period == 1) {
      periodString = "1st";
    } else if (period == 2) {
      periodString = "2nd";
    } else if (period == 3) {
      periodString = "3rd";
    } else if (period == 4) {
      periodString = "4th";
    } else if (period > 4) {
      periodString = "OT";
    }

    if (isHalftime) {
      clockString = "Halftime";
    } else {
      clockString = periodString + "  " + clock;
    }

    return clockString;
  }

  // dynamic getVTeamStandingsFromJson(dynamic game, dynamic json) {
  //   dynamic team;
  //   String teamId = game["vTeam"]["teamId"];

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
  //   String teamId = game["hTeam"]["teamId"];

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
    if (game["watch"]["broadcast"]["broadcasters"]["hTeam"].length > 0) {
      h = game["watch"]["broadcast"]["broadcasters"]["hTeam"][0]["shortName"];
    } else {
      h = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["vTeam"].length > 0) {
      v = game["watch"]["broadcast"]["broadcasters"]["vTeam"][0]["shortName"];
    } else {
      v = "";
    }

    howToWatch = "$nat  $v  $h";

    return howToWatch;
  }
}
