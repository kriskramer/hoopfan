import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/headers/completed_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/headers/in_progress_game_card_dashboard.dart';
import 'package:hoop/components/games_widgets/headers/upcoming_game_card_dashboard.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/utils/date_helper.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../services/headers.dart';

class TodaysGamesDashboard extends StatefulWidget {
  @override
  _TodaysGamesDashboardState createState() => _TodaysGamesDashboardState();
}

class _TodaysGamesDashboardState extends State<TodaysGamesDashboard> {
  Future<dynamic> _listGames;
  DateTime savedDate;
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
            var games = snapshot.data["scoreboard"];

            int count = games["games"].length;
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
            String savedDate = Provider.of<JsonFiles>(context, listen: false)
                .getSelectedDate();
            // parse date
            int year = int.parse(savedDate.substring(0, 4));
            int month = int.parse(savedDate.substring(4, 6));
            int day = int.parse(savedDate.substring(6, 8));
            DateTime parseDate = DateTime(year, month, day);
            DateTime todaysDate = DateTime.now();
            String dateInfo = parseDate.day == todaysDate.day
                ? "$count Game(s) Today"
                : "$count Game(s) on ${formatDate(parseDate.toString())[0]}";

            return Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  icon: Icon(Icons.arrow_circle_left, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      prevDay();
                    });
                  },
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                    size: 22.0,
                  ),
                  onPressed: () async {
                    DateTime date = await selectDate();
                    if (date != null) {
                      setState(
                          () => {handleNewDate(Utils.getDate(date), context)});
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_circle_right, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      nextDay();
                    });
                  },
                )
              ]),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.sports_basketball_sharp,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    dateInfo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              SizedBox(
                height: 5,
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
                  })
            ]);
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
              SizedBox(
                height: 30, //MediaQuery.of(context).size.height / 2,
              ),
              Card(
                  elevation: 4,
                  margin: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Center(
                          child: Text('Refresh data'),
                        ),
                        IconButton(
                            onPressed: () {
                              refreshGames();
                            },
                            icon: Icon(Icons.refresh_rounded))
                      ])),
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
    //print("Handle date function: $dt");
    Provider.of<JsonFiles>(context, listen: false).setSelectedDate(dt);
    refreshGames();
  }

  void nextDay() {
    var dt = Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    DateTime date = DateTime.parse(dt);
    date = date.add(Duration(days: 1));
    Provider.of<JsonFiles>(context, listen: false).setSelectedDate(date);
    refreshGames();
  }

  void prevDay() {
    var dt = Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    DateTime date = DateTime.parse(dt);
    date = date.add(Duration(days: -1));
    Provider.of<JsonFiles>(context, listen: false).setSelectedDate(date);
    refreshGames();
  }

  Future<dynamic> loadGames(BuildContext context) async {
    var selectedDate =
        Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    var selectedDate2 = DateHelper.formatDateWithDashes(selectedDate);

    return await Network.getJson(
      Urls.nbaGamesSelectedDate(selectedDate2),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
    //return await Network.getJson(Urls.nbaGamesToday());
  }

  Future<dynamic> loadGames2(BuildContext context) async {
    // Future<dynamic> empty;

    // // I can't remember why I put this in here...
    // if (!ModalRoute.of(context).isCurrent) {
    //   return empty;
    // }
    var selectedDate =
        Provider.of<JsonFiles>(context, listen: false).getSelectedDate();
    //print(selectedDate);
    var selectedDate2 = DateHelper.formatDateWithDashes(selectedDate);

    return await Network.getJson(
      Urls.nbaGamesSelectedDate(selectedDate2),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
    //return await Network.getJson(Urls.nbaGamesToday());
  }

  List<dynamic> getGamesWaiting(dynamic json) {
    List<dynamic> games = [];

    for (var g in json["games"]) {
      //print(g);
      if (g["gameStatus"] == 1) {
        games.add(g);
      }
    }

    return games;
  }

  List<dynamic> getGamesCompleted(dynamic json) {
    List<dynamic> games = [];

    for (var g in json["games"]) {
      //print(g);
      if (g["gameStatus"] == 3) {
        games.add(g);
      }
    }

    return games;
  }

  List<dynamic> getGamesInProgress(dynamic json) {
    List<dynamic> games = [];

    for (var g in json["games"]) {
      //print(g);
      if (g["gameStatus"] == 2) {
        games.add(g);
      }
    }

    return games;
  }

  Future<DateTime> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 90)),
      lastDate: DateTime.now().add(Duration(days: 90)),
    );
  }
}

class Utils {
  static String getDayOfWeek(DateTime date) => DateFormat('EEE').format(date);

  static String getDayOfMonth(DateTime date) => DateFormat('dd').format(date);

  static String getDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}
