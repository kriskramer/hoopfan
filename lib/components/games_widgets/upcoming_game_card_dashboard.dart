import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_latest.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_preview_article_header.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/utils/formatdate.dart';

import '../../screens/views/games/game_view.dart';

class UpcomingGameCardDashboard extends StatelessWidget {
  final dynamic game;
  UpcomingGameCardDashboard({this.game});

  @override
  Widget build(BuildContext context) {
    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["awayTeam"]["teamId"].toString());
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["homeTeam"]["teamId"].toString());
    var countdown = getStartCountdown(game);
    bool preview = game["isPreviewArticleAvail"];
    var gameId = game["gameId"];
    var date = game["gameUrlCode"].toString().split("/")[0];

    DateTime time = DateTime.parse(game["gameTimeUTC"]);
    DateTime newTime = time.toLocal();
    //print(newTime);
    // print("UTC time: $time");
    // print("TIme now: ${DateTime.now()}");
    // print(DateTime.now().difference(time));

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
                      )));
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              preview != null
                  ? GamePreviewArticleHeader(gameId: gameId, gameDate: date)
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
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
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
                    countdown != ""
                        ? Container(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              countdown,
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                            ))
                        : SizedBox(
                            height: 1,
                          ),
                  ]),
                  Text(
                    "(${hTeam.record})",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  CachedLogo(
                      radius: 30,
                      url: ConstantHelper.getTeamLogo(
                          game["homeTeam"]["teamId"].toString())),
                ],
              ),
              //GameFeedLatest(gameId)
            ],
          ),
        ),
      ),
    );
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

  String getStartCountdown(dynamic game) {
    String startTimeUTC = game["gameTimeUTC"];

    if (startTimeUTC == "") {
      return "";
    }

    DateTime start = DateTime.parse(startTimeUTC);

    Duration duration = start.difference(DateTime.now());

    if (duration.inMinutes < 91 && duration.inMinutes > 0) {
      return "${duration.inMinutes.toString()} min to go!";
    }

    return "";
  }
}
