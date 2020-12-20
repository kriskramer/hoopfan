import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games_view/game_view.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

class ScheduledGameCard extends StatelessWidget {
  final dynamic game;
  ScheduledGameCard({this.game});

  @override
  Widget build(BuildContext context) {
    bool isHomeTeam = game["isHomeTeam"];
    //bool notPlayed = game["hTeam"]["score"] == "";

    final standingsJson = Provider.of<JsonFiles>(context, listen: false)
        .getStandings()["league"]["standard"]["conference"];

    var oppStandings = getOppStandingsFromJson(game, standingsJson, isHomeTeam);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(isHomeTeam ? "vs" : "at"),
              SizedBox(
                width: 5,
              ),
              CachedLogo(
                radius: 30,
                url: isHomeTeam
                    ? ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])
                    : ConstantHelper.getTeamLogo(game["hTeam"]["teamId"]),
              ),
              SizedBox(
                width: 10,
              ),
              Column(children: [
                Text(
                  isHomeTeam
                      ? ConstantHelper.getTeamName(game["vTeam"]["teamId"])
                      : ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "(${oppStandings["win"]}-${oppStandings["loss"]})",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  getHowToWatch(),
                  style: TextStyle(fontSize: 10, color: Colors.green[600]),
                ),
              ]),
              SizedBox(
                width: 10,
              ),
              Column(children: [
                Text(
                  formatDate(game["startDateEastern"].toString()),
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
            ],
          ),
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

  dynamic getOppStandingsFromJson(dynamic game, dynamic json, bool isHomeTeam) {
    dynamic team;
    String oppId;

    if (isHomeTeam) {
      oppId = game["vTeam"]["teamId"];
    } else {
      oppId = game["hTeam"]["teamId"];
    }

    for (var t in json["east"]) {
      if (t["teamId"] == oppId) {
        team = t;
        break;
      }
    }
    for (var t in json["west"]) {
      if (t["teamId"] == oppId) {
        team = t;
        break;
      }
    }

    return team;
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
}
