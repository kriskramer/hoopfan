import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

import '../../../screens/views/games/game_view.dart';

class ScheduledGameCard extends StatelessWidget {
  final dynamic game;
  ScheduledGameCard({this.game});

  @override
  Widget build(BuildContext context) {
    bool isHomeTeam = game["isHomeTeam"];
    //bool notPlayed = game["hTeam"]["score"] == "";

    final standings = Provider.of<JsonFiles>(context, listen: false)
        .getLeagueStandings(); //["league"]["standard"]["conference"];
    final LeagueStanding vTeam =
        standings.getTeamStandings(game["vTeam"]["teamId"]);
    final LeagueStanding hTeam =
        standings.getTeamStandings(game["hTeam"]["teamId"]);

    // final standingsJson = Provider.of<JsonFiles>(context, listen: false)
    //     .getStandings()["league"]["standard"]["conference"];

    // var oppStandings = getOppStandingsFromJson(game, standingsJson, isHomeTeam);

    //dynamic test = ConstantHelper.getTeamDetailsExtra("123123123");

    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: InkWell(
          onTap: () {
            //Network.launchSite(games[index]["url"]);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameView(
                          game: game,
                        )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(isHomeTeam ? "vs" : "at"),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: CachedLogo(
                  radius: 30,
                  url: isHomeTeam
                      ? ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])
                      : ConstantHelper.getTeamLogo(game["hTeam"]["teamId"]),
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      isHomeTeam
                          ? ConstantHelper.getTeamName(game["vTeam"]["teamId"])
                          : ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      isHomeTeam
                          ? "(${vTeam.wins}-${vTeam.losses})"
                          : "(${hTeam.wins}-${hTeam.losses})",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Text(
                    //   getHowToWatch(),
                    //   style: TextStyle(fontSize: 10, color: Colors.green[600]),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Expanded(
                child: Column(children: [
                  Text(
                    formatDate(game["startDateEastern"].toString())[0],
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    game["startTimeEastern"].toString(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // String getHowToWatch() {
  //   String howToWatch = "";
  //   String nat, v, h;

  //   if (game["watch"]["broadcast"]["broadcasters"]["national"].length > 0) {
  //     nat = game["watch"]["broadcast"]["broadcasters"]["national"][0]
  //         ["shortName"];
  //   } else {
  //     nat = "";
  //   }
  //   if (game["watch"]["broadcast"]["broadcasters"]["hTeam"].length > 0) {
  //     h = game["watch"]["broadcast"]["broadcasters"]["hTeam"][0]["shortName"];
  //   } else {
  //     h = "";
  //   }
  //   if (game["watch"]["broadcast"]["broadcasters"]["vTeam"].length > 0) {
  //     v = game["watch"]["broadcast"]["broadcasters"]["vTeam"][0]["shortName"];
  //   } else {
  //     v = "";
  //   }

  //   howToWatch = nat.isEmpty ? "$v, $h" : "$nat, $v, $h";

  //   return howToWatch;
  // }
}
