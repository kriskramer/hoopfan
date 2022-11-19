import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

import '../../../screens/views/games/game_view.dart';

class TeamScheduleSmall extends StatelessWidget {
  final String teamId;
  TeamScheduleSmall({@required this.teamId});

  @override
  Widget build(BuildContext context) {
    List<dynamic> teamSchedule = [];
    List<dynamic> preseasonGames = [];
    List<dynamic> regseasonGames = [];

    var fullSchedule =
        Provider.of<JsonFiles>(context, listen: false).getFullSchedule();

    var nbaSchedule = fullSchedule["league"]["standard"];

    for (var s in nbaSchedule) {
      if (s["hTeam"]["teamId"].toString() == teamId ||
          s["vTeam"]["teamId"].toString() == teamId) {
        teamSchedule.add(s);
      }
    }

    for (var g in teamSchedule) {
      if (g["seasonStageId"] == 1) {
        preseasonGames.add(g);
      } else if (g["seasonStageId"] == 2) {
        regseasonGames.add(g);
      }
    }

    List<dynamic> listPrevious = [];
    List<dynamic> listUpcoming = [];
    List<dynamic> list = [];

    for (var g in teamSchedule) {
      var gameDate = DateTime.parse(g["startTimeUTC"]);
      if (gameDate.millisecondsSinceEpoch <
          DateTime.now().millisecondsSinceEpoch)
        listPrevious.add(g);
      else
        listUpcoming.add(g);
    }

    if (listPrevious[listPrevious.length - 1] != null) {
      list.add(Text("Last Game", style: TextStyle(fontSize: 16)));
      list.add(getGame(listPrevious[listPrevious.length - 1], context));
    }
    list.add(SizedBox(height: 8));
    list.add(Text("Next 3 Games", style: TextStyle(fontSize: 16)));
    if (listUpcoming.length > 0) {
      for (int i = 0; i < 3; i++) {
        if (listUpcoming[i] != null) {
          list.add(getGame(listUpcoming[i], context));
        }
      }
    }

    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [...list],
      ),
    ));
  }

  Future<dynamic> loadData(BuildContext context) async {
    var sched;
    if (Provider.of<JsonFiles>(context, listen: false)
            .getTeamSchedule(teamId) ==
        null) {
      sched = await Network.getJson(Urls.nbaTeamSchedule(teamId, "2022"));

      Provider.of<JsonFiles>(context, listen: false)
          .setTeamSchedule(teamId, sched);

      return sched;
    } else {
      return Provider.of<JsonFiles>(context, listen: false)
          .getTeamSchedule(teamId);
    }
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
            color: Colors.teal[100],
            padding: EdgeInsets.all(4),
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
