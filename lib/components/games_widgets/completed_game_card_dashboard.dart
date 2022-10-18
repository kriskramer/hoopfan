import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_latest.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/games/game_recap_article_header.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../screens/views/games/game_feed_view.dart';

class CompletedGameCardDashboard extends StatelessWidget {
  final dynamic game;

  CompletedGameCardDashboard({this.game});

  @override
  Widget build(BuildContext context) {
    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["vTeam"]["teamId"]);
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["hTeam"]["teamId"]);

    bool recap = game["isRecapArticleAvail"];
    var gameId = game["gameId"];
    var date = game["gameUrlCode"].toString().split("/")[0];

    bool isOvertime = false;
    if (game["period"] != null) {
      isOvertime = game["period"]["current"] > 4 ? true : false;
    }

    bool isHomeWin = isHomeTeamWinner(game);

    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GameFeedView(
                        game: game,
                      )));
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              recap
                  ? GameRecapArticleHeader(gameId: gameId, gameDate: date)
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CachedLogo(
                      radius: 35,
                      url: ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])),
                  vTeam != null
                      ? Text(
                          "(${vTeam.win}-${vTeam.loss})",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        )
                      : Text(""),
                  Column(children: [
                    Text(
                      formatDate(game["startDateEastern"].toString())[0],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Row(children: [
                      Text(
                        game["vTeam"]["score"].toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: isHomeWin
                                ? FontWeight.normal
                                : FontWeight.bold),
                      ),
                      Text(
                        " - ",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                      Text(
                        game["hTeam"]["score"],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: isHomeWin
                                ? FontWeight.bold
                                : FontWeight.normal),
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
                      url: ConstantHelper.getTeamLogo(game["hTeam"]["teamId"])),
                ],
              ),
              GameFeedLatest(gameId)
            ],
          ),
        ),
      ),
    );
  }

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
