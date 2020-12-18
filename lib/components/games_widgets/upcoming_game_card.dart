import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games_view/game_view.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';

class UpcomingGameCard extends StatelessWidget {
  final dynamic game;
  UpcomingGameCard({this.game});

  @override
  Widget build(BuildContext context) {
    final standingsJson = Provider.of<JsonFiles>(context, listen: false)
        .getStandings()["league"]["standard"]["conference"];

    dynamic vTeam = getVTeamStandingsFromJson(game, standingsJson);
    dynamic hTeam = getHTeamStandingsFromJson(game, standingsJson);

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
                      )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedLogo(
                radius: 35,
                url: ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])),
            Text(
              "(${vTeam["win"]}-${vTeam["loss"]})",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            Column(children: [
              Text(
                formatDate(game["startDateEastern"].toString()),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                game["startTimeEastern"].toString(),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ]),
            Text(
              "(${hTeam["win"]}-${hTeam["loss"]})",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
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

  dynamic getVTeamStandingsFromJson(dynamic game, dynamic json) {
    dynamic team;
    String teamId = game["vTeam"]["teamId"];

    for (var t in json["east"]) {
      if (t["teamId"] == teamId) {
        team = t;
        break;
      }
    }
    for (var t in json["west"]) {
      if (t["teamId"] == teamId) {
        team = t;
        break;
      }
    }

    return team;
  }

  dynamic getHTeamStandingsFromJson(dynamic game, dynamic json) {
    dynamic team;
    String teamId = game["hTeam"]["teamId"];

    for (var t in json["east"]) {
      if (t["teamId"] == teamId) {
        team = t;
        break;
      }
    }
    for (var t in json["west"]) {
      if (t["teamId"] == teamId) {
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
