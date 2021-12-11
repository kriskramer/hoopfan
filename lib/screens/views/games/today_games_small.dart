import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/completed_game_card.dart';
import 'package:hoop/components/games_widgets/completed_game_card_small.dart';
import 'package:hoop/components/games_widgets/horiz_calendar.dart';
import 'package:hoop/components/games_widgets/in_progress_game_card.dart';
import 'package:hoop/components/games_widgets/in_progress_game_card_small.dart';
import 'package:hoop/components/games_widgets/upcoming_game_card.dart';
import 'package:hoop/components/games_widgets/upcoming_game_card_small.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/utils/formatdate.dart';
import 'package:provider/provider.dart';

class TodaysGamesSmall extends StatefulWidget {
  @override
  _TodaysGamesSmallState createState() => _TodaysGamesSmallState();
}

class _TodaysGamesSmallState extends State<TodaysGamesSmall> {
  Future<dynamic> _listGames;
  DateTime selectedDate;
  Timer _timer;
  int timerDuration = 300;

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
                ? "$count games Today"
                : "$count games on ${formatDate(parseDate.toString())[0]}";

            return count == 0
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      Text('No games listed')
                    ],
                  )
                : ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            dateInfo,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: gamesInProgress.length > 4
                              ? 4
                              : gamesInProgress.length,
                          itemBuilder: (context, index) {
                            return InProgressGameCardSmall(
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
                            return CompletedGameCardSmall(
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
                            return UpcomingGameCardSmall(
                              game: gamesWaiting[index],
                            );
                          }),
                    ],
                  );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
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
        });
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
