import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/headers/completed_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/horiz_calendar.dart';
import 'package:hoop/components/games_widgets/headers/in_progress_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/headers/upcoming_game_card_dashboard.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/utils/formatdate.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Games"),
        toolbarHeight: 50,
      ),
      body: FutureBuilder(
          future:
              _listGames, //loadData(context), // Network.getJson(Urls.nbaGamesToday()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              //var games = snapshot.data;
              var games = snapshot.data;
              //Provider.of<JsonFiles>(context, listen: false).getTodaysGames();

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
                timerDuration = 150;
              }
              String selectedDate =
                  Provider.of<JsonFiles>(context, listen: false)
                      .getSelectedDate();
              // parse date
              int year = int.parse(selectedDate.substring(0, 4));
              int month = int.parse(selectedDate.substring(4, 6));
              int day = int.parse(selectedDate.substring(6, 8));
              DateTime parseDate = DateTime(year, month, day);
              DateTime todaysDate = DateTime.now();
              String dateInfo = parseDate.day == todaysDate.day
                  ? "$count Game(s) Today"
                  : "$count Game(s) on ${formatDate(parseDate.toString())[0]}";

              return count == 0
                  ? Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HorizontalCalendar(
                            date: DateTime.now(),
                            textColor: Colors.black45,
                            backgroundColor: Colors.white,
                            selectedColor: Colors.blue,
                            onDateSelected: (date) {
                              handleNewDate(
                                date,
                                context,
                              );
                              print("THis $date");
                            }),
                        SizedBox(
                          height: 150,
                        ),
                        Text('No games listed')
                      ],
                    )
                  : ListView(
                      children: [
                        HorizontalCalendar(
                            date: DateTime.now(),
                            textColor: Colors.black45,
                            backgroundColor: Colors.white,
                            selectedColor: Colors.blue,
                            onDateSelected: (date) {
                              if (date != null) {
                                handleNewDate(date, context);
                              }
                            }),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              dateInfo,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: gamesInProgress.length,
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
                            itemCount: gamesCompleted.length,
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
                            itemCount: gamesWaiting.length,
                            itemBuilder: (context, index) {
                              return UpcomingGameCardDashboard(
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
                      print("THis $date");
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Center(
                  child: Text('Unable to get data'),
                )
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
          }),
    );
  }

  void handleNewDate(String date, BuildContext context) {
    DateTime dt = DateTime.parse(date);
    print("Handle date function: $dt");
    Provider.of<JsonFiles>(context, listen: false).setSelectedDate(dt);
    refreshGames();
  }

  Future<dynamic> loadGames() async {
    var selectedDate =
        Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    print(selectedDate);
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
