import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_recap_article_header.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../../screens/views/games/game_view.dart';

class CompletedGameCard extends StatelessWidget {
  final dynamic game;

  CompletedGameCard({this.game});

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

    bool isOvertime = false;
    // if (game["period"] != null) {
    //   isOvertime = game["period"]["current"] > 4 ? true : false;
    // }

    bool isHomeWin = isHomeTeamWinner(game);

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
              builder: (context) => GameView(
                game: game,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedLogo(
                    radius: 35,
                    url: ConstantHelper.getTeamLogo(
                        game["awayTeam"]["teamId"].toString())),
                Text(
                  "(${vTeam.wins}-${vTeam.losses})",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
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
                          fontWeight:
                              isHomeWin ? FontWeight.normal : FontWeight.bold),
                    ),
                    Text(
                      " - ",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                    Text(
                      game["homeTeam"]["score"].toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight:
                              isHomeWin ? FontWeight.bold : FontWeight.normal),
                    ),
                  ]),
                  Text(
                    isOvertime ? "Final/OT" : "Final",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ]),
                Text(
                  "(${hTeam.wins}-${hTeam.losses})",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                CachedLogo(
                    radius: 35,
                    url: ConstantHelper.getTeamLogo(
                        game["homeTeam"]["teamId"].toString())),
              ],
            ),
            // recap
            //     ? GameRecapArticleHeader(gameId: gameId, gameDate: date)
            //     : SizedBox(),
          ],
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

  // String getHowToWatch() {
  //   String howToWatch = "";
  //   String nat, v, h;

  //   if (game["watch"]["broadcast"]["broadcasters"]["national"].length > 0) {
  //     nat = game["watch"]["broadcast"]["broadcasters"]["national"][0]
  //         ["shortName"];
  //   } else {
  //     nat = "";
  //   }
  //   if (game["watch"]["broadcast"]["broadcasters"]["homeTeam"].length > 0) {
  //     h = game["watch"]["broadcast"]["broadcasters"]["homeTeam"][0]
  //         ["shortName"];
  //   } else {
  //     h = "";
  //   }
  //   if (game["watch"]["broadcast"]["broadcasters"]["awayTeam"].length > 0) {
  //     v = game["watch"]["broadcast"]["broadcasters"]["awayTeam"][0]
  //         ["shortName"];
  //   } else {
  //     v = "";
  //   }

  //   howToWatch = "$nat  $v  $h";

  //   return howToWatch;
  // }

  bool isHomeTeamWinner(dynamic game) {
    bool isWinner = false;

    int vTeamScore = game["awayTeam"]["score"];
    int hTeamScore = game["homeTeam"]["score"];

    if (hTeamScore > vTeamScore) {
      isWinner = true;
    }

    return isWinner;
  }

  bool getViewingTeamWinnerResult(dynamic game, String teamId) {
    int vTeamScore = game["awayTeam"]["score"];
    int hTeamScore = game["homeTeam"]["score"];
    bool isHomeTeam = false;

    if (game["homeTeam"]["teamId"] == teamId) {
      isHomeTeam = true;
    }

    if (hTeamScore > vTeamScore && isHomeTeam) {
      return true;
    } else if (hTeamScore > vTeamScore && !isHomeTeam) {
      return false;
    } else if (hTeamScore < vTeamScore && isHomeTeam) {
      return false;
    } else {
      return true;
    }
  }
}
