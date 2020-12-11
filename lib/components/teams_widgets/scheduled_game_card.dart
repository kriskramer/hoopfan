import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games_view/game_view.dart';

class ScheduledGameCard extends StatelessWidget {
  final dynamic game;
  ScheduledGameCard({this.game});

  @override
  Widget build(BuildContext context) {
    bool isHomeTeam = game["isHomeTeam"];
    bool notPlayed = game["hTeam"]["score"] == "";

    //dynamic test = ConstantHelper.getTeamDetailsExtra("123123123");

    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
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
                url: isHomeTeam
                    ? ConstantHelper.getTeamLogo(game["vTeam"]["teamId"])
                    : ConstantHelper.getTeamLogo(game["hTeam"]["teamId"]),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                isHomeTeam
                    ? ConstantHelper.getTeamName(game["vTeam"]["teamId"])
                    : ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
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
}
