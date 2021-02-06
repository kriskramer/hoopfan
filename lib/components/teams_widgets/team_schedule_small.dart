import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games_view/game_view.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamScheduleSmall extends StatelessWidget {
  final String teamId;
  TeamScheduleSmall({@required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: Network.getJson(Urls.nbaTeamSchedule(teamId, "2020")),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> games = snapshot.data["league"]["standard"];
          List<Widget> list = List<Widget>();

          for (var g in games) {
            list.add(getGameCard(g, context));
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [...list],
            ),
          );
        } else {
          return Text(' ');
        }
      },
    ));
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }

  Widget getGameCard(dynamic game, BuildContext context) {
    int gameStatus = game["statusNum"];

    return Card(
      elevation: 2,
      color: gameStatus == 1 ? Colors.white : Colors.brown[100],
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
        child: Container(
            width: 225,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatDate(game["startDateEastern"])),
                    gameStatus == 1
                        ? Text(game["startTimeEastern"])
                        : Text('Final'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantHelper.getTeamName(game["vTeam"]["teamId"]),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(game["vTeam"]["score"]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(game["hTeam"]["score"]),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
