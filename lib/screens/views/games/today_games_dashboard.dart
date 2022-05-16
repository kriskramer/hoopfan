import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/completed_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/completed_game_card_small.dart';
import 'package:hoop/components/games_widgets/in_progress_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/in_progress_game_card_small.dart';
import 'package:hoop/components/games_widgets/upcoming_game_card.dart';
import 'package:hoop/components/games_widgets/upcoming_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/upcoming_game_card_small.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/games/today_games.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:provider/provider.dart';

class TodaysGamesDashboard extends StatefulWidget {
  @override
  _TodaysGamesDashboardState createState() => _TodaysGamesDashboardState();
}

class _TodaysGamesDashboardState extends State<TodaysGamesDashboard> {
  Future<dynamic> _listGames;
  DateTime selectedDate;
  Timer _timer;
  int timerDuration = 300;

  @override
  void initState() {
    super.initState();

    _listGames = loadGames(context);
    startTimer();
  }

  void refreshGames() {
    setState(() {
      _listGames = loadGames2(context);
    });
  }

  void startTimer() {
    _timer = new Timer.periodic(Duration(seconds: timerDuration), (Timer t) {
      refreshGames();
      print('today_games_small timer tick');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print('TestWidget: ${ModalRoute.of(context).isCurrent}');
    return FutureBuilder(
        future:
            _listGames, //loadData(context), // Network.getJson(Urls.nbaGamesToday()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var games = snapshot.data;

            int count = games["numGames"];
            var gamesCompleted = getGamesCompleted(games);
            var gamesInProgress = getGamesInProgress(games);
            var gamesWaiting = getGamesWaiting(games);

            // Don't need to update the view if all the games are done
            if (gamesCompleted.length == count) {
              _timer.cancel();
            }

            if (gamesWaiting.length > 0 && gamesInProgress.length == 0) {
              timerDuration = 1000;
            }
            if (gamesInProgress.length > 0) {
              timerDuration = 240;
            }
            String selectedDate = Provider.of<JsonFiles>(context, listen: false)
                .getSelectedDate();
            // parse date
            int year = int.parse(selectedDate.substring(0, 4));
            int month = int.parse(selectedDate.substring(4, 6));
            int day = int.parse(selectedDate.substring(6, 8));
            DateTime parseDate = DateTime(year, month, day);
            DateTime todaysDate = DateTime.now();
            String dateInfo = parseDate.day == todaysDate.day
                ? "$count Games Today"
                : "$count games on ${formatDate(parseDate.toString())[0]}";

            return count == 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('No games listed'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    refreshGames();
                                  });
                                },
                                icon: Icon(Icons.refresh))
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Column(children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.sports_basketball_sharp,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                dateInfo,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ]),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: gamesInProgress.length > 4
                            ? 4
                            : gamesInProgress.length,
                        itemBuilder: (context, index) {
                          return InProgressGameCardDashboard(
                            game: gamesInProgress[index],
                          );
                        }),
                    gamesInProgress.length > 0
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: gamesCompleted.length > 4
                            ? 4
                            : gamesCompleted.length,
                        itemBuilder: (context, index) {
                          return CompletedGameCardDashboard(
                            game: gamesCompleted[index],
                          );
                        }),
                    gamesCompleted.length > 0
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            gamesWaiting.length > 4 ? 4 : gamesWaiting.length,
                        itemBuilder: (context, index) {
                          return UpcomingGameCardDashboard(
                            game: gamesWaiting[index],
                          );
                        })
                  ]);
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
              SizedBox(
                height: 100, //MediaQuery.of(context).size.height / 2,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(width: 20),
                Center(
                  child: Text('Refresh data'),
                ),
                IconButton(
                    onPressed: () {
                      refreshGames();
                    },
                    icon: Icon(Icons.refresh_rounded))
              ])
            ]);
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Getting games data..."),
                ],
              ),
            );
          }
        });
  }

  void handleNewDate(String date, BuildContext context) {
    DateTime dt = DateTime.parse(date);
    print("Handle date function: $dt");
    Provider.of<JsonFiles>(context, listen: false).setSelectedDate(dt);
    refreshGames();
  }

  Future<dynamic> loadGames(BuildContext context) async {
    var selectedDate =
        Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    print(selectedDate);

    return await Network.getJson(Urls.nbaGamesSelectedDate(selectedDate));
  }

  Future<dynamic> loadGames2(BuildContext context) async {
    print('TestWidget: ${ModalRoute.of(context).isCurrent}');

    Future<dynamic> empty;

    if (!ModalRoute.of(context).isCurrent) {
      return empty;
    }
    var selectedDate =
        Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    print(selectedDate);

    return await Network.getJson(Urls.nbaGamesSelectedDate(selectedDate));
  }

  List<dynamic> getGamesWaiting(dynamic json) {
    List<dynamic> games = [];

    for (var g in json["games"]) {
      //print(g);
      if (g["isGameActivated"] == false && g["statusNum"] == 1) {
        games.add(g);
      }
    }

    return games;
  }

  List<dynamic> getGamesCompleted(dynamic json) {
    List<dynamic> games = [];

    for (var g in json["games"]) {
      //print(g);
      if (g["isGameActivated"] == false && g["statusNum"] == 3) {
        games.add(g);
      }
    }

    return games;
  }

  List<dynamic> getGamesInProgress(dynamic json) {
    List<dynamic> games = [];

    for (var g in json["games"]) {
      //print(g);
      if (g["isGameActivated"]) {
        games.add(g);
      }
    }

    return games;
  }
}
