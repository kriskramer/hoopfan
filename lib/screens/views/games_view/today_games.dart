import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/completed_game_card.dart';
import 'package:hoop/components/games_widgets/horiz_calendar.dart';
import 'package:hoop/components/games_widgets/in_progress_game_card.dart';
import 'package:hoop/components/games_widgets/upcoming_game_card.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TodaysGames extends StatefulWidget {
  @override
  _TodaysGamesState createState() => _TodaysGamesState();
}

class _TodaysGamesState extends State<TodaysGames> {
  Future<dynamic> _listGames;
  DateTime selectedDate;
  Timer _timer;
  int timerDuration = 150;

  @override
  void initState() {
    super.initState();
    _listGames = loadGames();
    startTimer();
  }

  void refreshGames() {
    setState(() {
      _listGames = loadGames();
    });
  }

  void startTimer() {
    _timer = new Timer.periodic(Duration(seconds: timerDuration), (Timer t) {
      refreshGames();
      print('today_games timer tick');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future:
                _listGames, //loadData(context), // Network.getJson(Urls.nbaGamesToday()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                //var games = snapshot.data;
                var games = snapshot.data;
                //Provider.of<JsonFiles>(context, listen: false).getTodaysGames();

                var count = games["games"].length;

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
                  timerDuration = 150;
                }

                return count == 0
                    ? Column(
                        children: [
                          HorizontalCalendar(
                              date: DateTime.now(),
                              textColor: Colors.black45,
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue,
                              onDateSelected: (date) {
                                handleNewDate(date, context);
                              }),
                          Center(
                            child: Text('No games listed'),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          HorizontalCalendar(
                              date: DateTime.now(),
                              textColor: Colors.black45,
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue,
                              onDateSelected: (date) {
                                handleNewDate(date, context);
                              }),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: gamesInProgress.length,
                              itemBuilder: (context, index) {
                                return InProgressGameCard(
                                  game: gamesInProgress[index],
                                );
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: gamesCompleted.length,
                              itemBuilder: (context, index) {
                                return CompletedGameCard(
                                  game: gamesCompleted[index],
                                );
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: gamesWaiting.length,
                              itemBuilder: (context, index) {
                                return UpcomingGameCard(
                                  game: gamesWaiting[index],
                                );
                              }),
                        ],
                      );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Column(children: [
                  HorizontalCalendar(
                      date: DateTime.now(),
                      textColor: Colors.black45,
                      backgroundColor: Colors.white,
                      selectedColor: Colors.blue,
                      onDateSelected: (date) {
                        handleNewDate(date, context);
                      }),
                  Center(
                    child: Text('No games listed'),
                  )
                ]);
              } else {
                return Center(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      child: CircularProgressIndicator()),
                );
              }
            }));
  }

  void handleNewDate(String date, BuildContext context) {
    DateTime dt = DateTime.parse(date);
    Provider.of<JsonFiles>(context, listen: false).setSelectedDate(dt);
    refreshGames();
  }

  Future<dynamic> loadGames() async {
    var selectedDate =
        Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    return await Network.getJson(Urls.nbaGamesSelectedDate(selectedDate));
  }

  // Future<bool> loadData(BuildContext context) async {
  //   if (Provider.of<JsonFiles>(context, listen: false).getTodaysGames() ==
  //       null) {
  //     var selectedDate =
  //         Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
  //     var games =
  //         await Network.getJson(Urls.nbaGamesSelectedDate(selectedDate));

  //     if (games != null) {
  //       Provider.of<JsonFiles>(context, listen: false).setTodaysGames(games);
  //       return true;
  //     }
  //     return false;
  //   }

  //   return false;
  // }

  // Widget getDateSlider() {
  //   Widget d;

  //   DateTime today = DateTime.now();

  //   return d;
  // }

  List<dynamic> getGamesWaiting(dynamic json) {
    List<dynamic> games = new List<dynamic>();

    for (var g in json["games"]) {
      //print(g);
      if (g["isGameActivated"] == false && g["statusNum"] == 1) {
        games.add(g);
      }
    }

    return games;
  }

  List<dynamic> getGamesCompleted(dynamic json) {
    List<dynamic> games = new List<dynamic>();

    for (var g in json["games"]) {
      //print(g);
      if (g["isGameActivated"] == false && g["statusNum"] == 3) {
        games.add(g);
      }
    }

    return games;
  }

  List<dynamic> getGamesInProgress(dynamic json) {
    List<dynamic> games = new List<dynamic>();

    for (var g in json["games"]) {
      //print(g);
      if (g["isGameActivated"]) {
        games.add(g);
      }
    }

    return games;
  }
}
