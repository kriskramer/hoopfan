import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_main.dart';
import 'package:hoop/components/games_widgets/arena_card.dart';
import 'package:hoop/components/games_widgets/fab_with_icons.dart';
import 'package:hoop/components/games_widgets/game_leaders_feed.dart';
import 'package:hoop/components/games_widgets/game_news_view.dart';
import 'package:hoop/components/games_widgets/game_officials.dart';
import 'package:hoop/components/games_widgets/game_stats_view.dart';
import 'package:hoop/components/games_widgets/in_progress_game_header.dart';
import 'package:hoop/components/games_widgets/scheduled_game_header.dart';
import 'package:hoop/components/games_widgets/win_prob.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../../components/games_widgets/game_feed_chat_popup.dart';
import 'game_info_view.dart';

class GameFeedView extends StatefulWidget {
  final dynamic game;

  GameFeedView({this.game});

  @override
  _GameFeedViewState createState() => _GameFeedViewState();
}

class _GameFeedViewState extends State<GameFeedView> {
  Future<dynamic> _gameData;
  Timer _timer;
  int timerDuration = 30;
  String vTeamScore;
  String hTeamScore;
  String period;
  String clock;
  var date;
  String gameId;
  dynamic stats;
  dynamic gameData;

  @override
  void initState() {
    super.initState();
    _gameData = loadGameData();
    // _timer = new Timer.periodic(Duration(seconds: timerDuration), (Timer t) {
    //   refreshGameData();
    //   print('game_view timer tick');
    // });
  }

  void refreshGameData() {
    setState(() {
      _gameData = loadGameData();
    });
  }

  @override
  void dispose() {
    // Call code here to decrement the viewing numbers for this game

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (vTeamScore == null) vTeamScore = widget.game["vTeam"]["score"];
    if (hTeamScore == null) hTeamScore = widget.game["hTeam"]["score"];
    var gameStatus = widget.game["statusNum"];
    gameId = widget.game["gameId"];

    DatabaseReference gameDataDb =
        FirebaseDatabase.instance.ref('gameData/$gameId');

    return Scaffold(
      bottomNavigationBar: gameStatus > 1
          ? GameLeadersFeed(
              game: widget.game,
            )
          : SizedBox(),
      resizeToAvoidBottomInset: true,
      body: StreamBuilder(
          //future: _gameData,
          stream: gameDataDb.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              //print('reloading game_view data');
              DataSnapshot dataValues = snapshot.data.snapshot;
              Map<dynamic, dynamic> values = dataValues.value;
              if (values == null) {
                return Column(children: [
                  Text("No data"),
                ]);
              }
              gameData = values["data"]["basicGameData"];
              stats = values["data"]["stats"];

              var gameActivated = gameData["isGameActivated"];

              //gameId = gameData["gameId"];
              date = gameData["gameUrlCode"].toString().split("/")[0];

              vTeamScore = gameData["vTeam"]["score"];
              hTeamScore = gameData["hTeam"]["score"];

              Provider.of<JsonFiles>(context, listen: false)
                  .setCurrentGameStats(gameId, stats);

              // if (gameData["isGameActivated"]) {
              //   timerDuration = 25;
              // } else {
              //   timerDuration = 120;

              //   int startingMinutes = getStartCountdown(gameData);
              //   if (startingMinutes == null) {
              //     _timer.cancel();
              //   }
              // }
              return SafeArea(
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    iconTheme: IconThemeData(color: Colors.blue),
                    pinned: true,
                    elevation: 10,
                    collapsedHeight: 132,
                    backgroundColor: Colors.white,
                    flexibleSpace: Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: gameStatus > 1 || gameActivated
                          ? Column(children: [
                              InProgressGameHeader(
                                  gameData: gameData, stats: stats),
                              WinProbability(gameId: gameId),
                            ])
                          : ScheduledGameHeader(gameData: gameData),
                    ),
                    expandedHeight: 120,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          // gameStatus == 1
                          //     ? SizedBox() // Replace with HowToWatch widget if status is 1 or 2
                          //     : GameFeedMain(gameId, gameData, stats),
                          GameFeedMain(gameId, gameData, stats),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ]),
                  ),
                ]),
              );
            } else {
              return NoConnection();
            }
          }),
      floatingActionButton: _buildFab(context, stats),
    );
  }

  Widget _buildFab(BuildContext context, dynamic stats) {
    final icons = [
      Icons.settings,
      Icons.article_outlined,
      Icons.sports_basketball,
      Icons.sms,
    ];

    return FabWithIcons(
      icons: icons,
      onIconTapped: (index) {
        if (index == 0) {
          // show game settings page
          showDialog(
              context: context,
              builder: (context) {
                return GameSettings(gameData, gameId, _update);
              });
        } else if (index == 1) {
          //show news page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameNewsView(gameData, gameId)),
          );
        } else if (index == 2) {
          // show stats page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameStatsView(gameData, gameId)),
          );
        } else if (index == 3) {
          // chat
          showDialog(
              context: context,
              builder: (context) {
                return GameFeedChatPopup(
                  gameId: gameId,
                  vTeamId: gameData["vTeam"]["teamId"],
                  hTeamId: gameData["hTeam"]["teamId"],
                );
              });
        }
      },
    );
  }

  void _update(int count) {
    setState(() => refreshGameData());
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: const Text('snack'),
    //   duration: const Duration(seconds: 5),
    //   action: SnackBarAction(
    //     label: 'ACTION',
    //     onPressed: () {},
    //   ),
    // ));
  }

  Future<dynamic> loadGameData() async {
    String gameId = widget.game["gameId"];
    String gameUrlCode = widget.game["gameUrlCode"];
    String gameDate = gameUrlCode.split("/")[0];
    print('game_view network call');
    return await Network.getJson(Urls.nbaBoxScore(gameDate, gameId));
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }

  Widget getTicketsCard() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("GET TICKETS", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: Text(
                  //widget.game["tickets"]["mobileApp"],
                  'Coming Soon',
                  style: TextStyle(fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }

  String getNewsSearchString(dynamic gameData) {
    var vTeamName = ConstantHelper.getTeamName(gameData["vTeam"]["teamId"]);
    var hTeamName = ConstantHelper.getTeamName(gameData["hTeam"]["teamId"]);

    var search = "nba game " +
        vTeamName +
        " at " +
        hTeamName +
        " " +
        gameData["startDateEastern"];

    return search;
  }

  String getTwitterSearchString(dynamic gameData) {
    var vTeamName = ConstantHelper.getTeamName(gameData["vTeam"]["teamId"]);
    var hTeamName = ConstantHelper.getTeamName(gameData["hTeam"]["teamId"]);

    var search = vTeamName + " " + hTeamName;

    return search;
  }

  int getStartCountdown(dynamic game) {
    String startTimeUTC = game["startTimeUTC"];

    if (startTimeUTC == "") {
      return null;
    }

    DateTime start = DateTime.parse(startTimeUTC);
    Duration duration = start.difference(DateTime.now());

    return duration.inMinutes;
  }
}

class ChatItem {}
