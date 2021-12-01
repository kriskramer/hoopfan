import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games/game_view.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class TeamScheduleSmall extends StatelessWidget {
  final String teamId;
  TeamScheduleSmall({@required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: Network.getJson(Urls.nbaTeamSchedule(teamId, "2021")),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> games = snapshot.data["league"]["standard"];
          List<Widget> list = [];
          List<dynamic> listPrevious = [];
          List<dynamic> listUpcoming = [];

          for (var g in games) {
            if (g["statusNum"] == 3) {
              listPrevious.add(g);
            }
            if (g["statusNum"] == 1 || g["statusNum"] == 2) {
              listUpcoming.add(g);
            }
          }

          if (listPrevious[listPrevious.length - 1] != null) {
            list.add(Text("Last Game", style: TextStyle(fontSize: 16)));
            list.add(getGame(listPrevious[listPrevious.length - 1], context));
          }
          list.add(SizedBox(height: 8));
          list.add(Text("Next 3 Games", style: TextStyle(fontSize: 16)));
          for (int i = 0; i < 3; i++) {
            if (listUpcoming[i] != null) {
              list.add(getGame(listUpcoming[i], context));
            }
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
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

  Widget getGame(dynamic game, BuildContext context) {
    int gameStatus = game["statusNum"];
    int teamColor = ConstantHelper.getTeamColor(teamId);

    if (gameStatus == 1) {
      // Upcoming game
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GameView(
                        game: game,
                      )));
        },
        child: Container(
            width: MediaQuery.of(context).size.width - 30,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatDate(game["startDateEastern"])),
                    SizedBox(width: 5),
                    Text(game["startTimeEastern"])
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantHelper.getTeamName(game["vTeam"]["teamId"]),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(game["vTeam"]["score"]),
                    SizedBox(width: 10),
                    Text(
                      ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(game["hTeam"]["score"]),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
      );
    } else {
      // In progress or completed game
      bool isHomeWin = isHomeTeamWinner(game);
      //bool isViewingTeamWin = getViewingTeamWinnerResult(game, teamId);

      return InkWell(
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
            width: MediaQuery.of(context).size.width - 30,
            //padding: EdgeInsets.all(8),
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
                          fontWeight:
                              isHomeWin ? FontWeight.normal : FontWeight.bold),
                    ),
                    Text(
                      game["vTeam"]["score"],
                      style: TextStyle(
                          fontWeight:
                              isHomeWin ? FontWeight.normal : FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantHelper.getTeamName(game["hTeam"]["teamId"]),
                      style: TextStyle(
                          fontWeight:
                              isHomeWin ? FontWeight.bold : FontWeight.normal),
                    ),
                    Text(
                      game["hTeam"]["score"],
                      style: TextStyle(
                          fontWeight:
                              isHomeWin ? FontWeight.bold : FontWeight.normal),
                    ),
                  ],
                )
              ],
            )),
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
