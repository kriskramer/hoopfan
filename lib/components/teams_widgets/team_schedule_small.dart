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
    int teamColor = ConstantHelper.getTeamColor(teamId);

    if (gameStatus == 1) {
      return Card(
        elevation: 2,
        color: Colors.white,
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
                      Text(game["startTimeEastern"])
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
    } else {
      bool isHomeWin = isHomeTeamWinner(game);
      bool isViewingTeamWin = getViewingTeamWinnerResult(game, teamId);

      return Card(
        elevation: 2,
        color: Color(teamColor).withAlpha(50),
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
                      Text('Final'),
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
                        style: TextStyle(
                            fontWeight: isHomeWin
                                ? FontWeight.normal
                                : FontWeight.bold),
                      ),
                      Text(
                        game["vTeam"]["score"],
                        style: TextStyle(
                            fontWeight: isHomeWin
                                ? FontWeight.normal
                                : FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                        style: TextStyle(
                            fontWeight: isHomeWin
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      Text(
                        game["hTeam"]["score"],
                        style: TextStyle(
                            fontWeight: isHomeWin
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ],
                  )
                ],
              )),
        ),
      );
    }
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
