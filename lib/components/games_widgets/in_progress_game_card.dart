import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_preview_article_header.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../screens/views/games/game_view.dart';

class InProgressGameCard extends StatelessWidget {
  final dynamic game;
  InProgressGameCard({this.game});

  @override
  Widget build(BuildContext context) {
    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["vTeam"]["teamId"]);
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["hTeam"]["teamId"]);

    String vTeamScore =
        game["vTeam"]["score"] == "" ? "0" : game["vTeam"]["score"];
    String hTeamScore =
        game["hTeam"]["score"] == "" ? "0" : game["hTeam"]["score"];

    bool preview = game["isPreviewArticleAvail"];
    var gameId = game["gameId"];
    var date = game["gameUrlCode"].toString().split("/")[0];

    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameView(
                game: game,
              ),
            ),
          );
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
                    style: TextStyle(fontSize: 16, color: Colors.green[800]),
                  ),
                ]),
                Text(
                  "(${hTeam.wins}-${hTeam.losses})",
                  style: TextStyle(color: Colors.grey[700]),
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
