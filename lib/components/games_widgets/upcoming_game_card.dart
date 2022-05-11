import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_preview_article_header.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/utils/formatdate.dart';

import '../../screens/views/games/game_feed_view.dart';

class UpcomingGameCard extends StatelessWidget {
  final dynamic game;
  UpcomingGameCard({this.game});

  @override
  Widget build(BuildContext context) {
    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["vTeam"]["teamId"]);
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["hTeam"]["teamId"]);
    var countdown = getStartCountdown(game);
    bool preview = game["isPreviewArticleAvail"];
    var gameId = game["gameId"];
    var date = game["gameUrlCode"].toString().split("/")[0];

    DateTime time = DateTime.parse(game["startTimeUTC"]);
    DateTime newTime = time.toLocal();
    print(newTime);
    // print("UTC time: $time");
    // print("TIme now: ${DateTime.now()}");
    // print(DateTime.now().difference(time));

    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GameFeedView(
                        game: game,
                      )));
        },
        child: Column(
          children: [
            preview
                ? GamePreviewArticleHeader(gameId: gameId, gameDate: date)
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedLogo(
                    radius: 35,
                    url: ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])),
                Text(
                  "(${vTeam.wins}-${vTeam.losses})",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                Column(children: [
                  Text(
                    formatDate(game["startTimeUTC"].toString())[0],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    formatDate(game["startTimeUTC"].toString())[1],
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
                  "(${hTeam.wins}-${hTeam.losses})",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                CachedLogo(
                    radius: 35,
                    url: ConstantHelper.getTeamLogo(game["hTeam"]["teamId"])),
              ],
            ),
          ],
        ),
      ),
    );
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

  String getStartCountdown(dynamic game) {
    String startTimeUTC = game["startTimeUTC"];

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
