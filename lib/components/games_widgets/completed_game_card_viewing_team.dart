import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games_view/game_view.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

class CompletedGameCardViewingTeam extends StatelessWidget {
  final dynamic game;
  final String viewingTeam;

  CompletedGameCardViewingTeam({this.game, this.viewingTeam});

  @override
  Widget build(BuildContext context) {
    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["vTeam"]["teamId"]);
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["hTeam"]["teamId"]);

    // dynamic vTeam = getVTeamStandingsFromJson(game, standingsJson);
    // dynamic hTeam = getHTeamStandingsFromJson(game, standingsJson);

    bool isOvertime = false;
    if (game["period"] != null) {
      isOvertime = game["period"]["current"] > 4 ? true : false;
    }

    bool isHomeWin = isHomeTeamWinner(game);
    bool isViewingTeamWin = getViewingTeamWinnerResult(game, viewingTeam);

    return Container(
      //margin: EdgeInsets.all(5),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedLogo(
                radius: 35,
                url: ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])),
            Text(
              "(${vTeam.wins}-${vTeam.losses})",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            Column(children: [
              Text(
                formatDate(game["startDateEastern"].toString()),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Row(children: [
                Text(
                  game["vTeam"]["score"].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: isViewingTeamWin ? Colors.blue : Colors.red,
                      fontWeight:
                          isHomeWin ? FontWeight.normal : FontWeight.bold),
                ),
                Text(
                  " - ",
                  style: TextStyle(
                      fontSize: 14,
                      color: isViewingTeamWin ? Colors.blue : Colors.red),
                ),
                Text(
                  game["hTeam"]["score"],
                  style: TextStyle(
                      fontSize: 20,
                      color: isViewingTeamWin ? Colors.blue : Colors.red,
                      fontWeight:
                          isHomeWin ? FontWeight.bold : FontWeight.normal),
                ),
              ]),
              Text(
                isOvertime ? "Final/OT" : "Final",
                style: TextStyle(
                    color: isViewingTeamWin ? Colors.blue : Colors.red,
                    fontSize: 16),
              ),
            ]),
            Text(
              "(${hTeam.wins}-${hTeam.losses})",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            CachedLogo(
                radius: 35,
                url: ConstantHelper.getTeamLogo(game["hTeam"]["teamId"])),
          ],
        ),
      ),
    );
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
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

  bool isHomeTeamWinner(dynamic game) {
    bool isWinner = false;

    int vTeamScore = int.parse(game["vTeam"]["score"]);
    int hTeamScore = int.parse(game["hTeam"]["score"]);

    if (hTeamScore > vTeamScore) {
      isWinner = true;
    }

    return isWinner;
  }

  bool getViewingTeamWinnerResult(dynamic game, String teamId) {
    int vTeamScore = int.parse(game["vTeam"]["score"]);
    int hTeamScore = int.parse(game["hTeam"]["score"]);
    bool isHomeTeam = false;

    if (game["hTeam"]["teamId"] == teamId) {
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
