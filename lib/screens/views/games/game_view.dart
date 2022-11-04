import 'package:flutter/material.dart';
import 'package:hoop/components/game_feed_widgets/chat_feed.dart';
import 'package:hoop/components/game_feed_widgets/chat_feed_count.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_count.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_main.dart';
import 'package:hoop/components/games_widgets/fab_with_icons.dart';
import 'package:hoop/components/games_widgets/game_news_view.dart';
import 'package:hoop/components/games_widgets/game_stats_view.dart';
import 'package:hoop/components/games_widgets/in_progress_game_header.dart';
import 'package:hoop/components/games_widgets/scheduled_game_header.dart';
import 'package:hoop/components/games_widgets/win_prob.dart';
import 'package:hoop/models/game_data.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../../components/games_widgets/game_feed_chat_popup.dart';
import 'game_info_view.dart';

class GameView extends StatefulWidget {
  final dynamic game;
  final dynamic gameData;

  GameView({this.game, this.gameData});

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  String gameId;
  dynamic gameData;
  GameData game;
  bool showChat = false;
  bool showPbp = true;
  bool showStats = false;
  bool showNews = false;

  @override
  void dispose() {
    // Call code here to decrement the viewing numbers for this game

    super.dispose();
  }

  void pbpClick() {
    setState(() {
      showPbp = true;
      showChat = false;
      showStats = false;
      showNews = false;
    });
  }

  void chatClick() {
    setState(() {
      showPbp = false;
      showChat = true;
      showStats = false;
      showNews = false;
    });
  }

  void statsClick() {
    setState(() {
      showPbp = false;
      showChat = false;
      showStats = true;
      showNews = false;
    });
  }

  void newsClick() {
    setState(() {
      showPbp = false;
      showChat = false;
      showStats = false;
      showNews = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var gameStatus = widget.game["gameStatus"];
    gameId = widget.game["gameId"];
    int vTeamId = widget.game["awayTeam"]["teamId"];
    int hTeamId = widget.game["homeTeam"]["teamId"];

    DatabaseReference gameDataDb =
        FirebaseDatabase.instance.ref('gameData22/$gameId');

    return Scaffold(
      // bottomNavigationBar: gameStatus > 1
      //     ? GameLeadersFeed(
      //         game: widget.game,
      //       )
      //     : SizedBox(),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  pbpClick();
                },
                icon: Icon(Icons.sports_basketball)),
            GameFeedCount(gameId),
          ],
        ),
        Row(
          children: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  chatClick();
                },
                icon: Icon(
                  Icons.comment,
                )),
            ChatFeedCount(gameId),
          ],
        ),
        IconButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GameStatsView(widget.game, gameId, game)),
              );
            },
            icon: Icon(
              Icons.stacked_bar_chart_sharp,
            )),
        IconButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameNewsView(widget.game, gameId)),
              );
            },
            icon: Icon(
              Icons.article,
            )),
        Container(
          width: 75,
          decoration: BoxDecoration(color: Colors.blue),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return GameFeedChatPopup(
                        gameId: gameId,
                        vTeamId: vTeamId,
                        hTeamId: hTeamId,
                      );
                    });
                setState(() {
                  showChat = true;
                  showPbp = false;
                });
              },
              icon: Icon(Icons.add_comment_outlined)),
        )
      ]),
      resizeToAvoidBottomInset: true,
      body: StreamBuilder(
          //future: _gameData,
          stream: gameDataDb.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              DataSnapshot dataValues = snapshot.data.snapshot;
              Map<dynamic, dynamic> values = dataValues.value;
              if (values == null) {
                // If no game data yet...

                //populateGameData(gameId, widget.game);
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
                        child: ScheduledGameHeader(
                          gameData: widget.game,
                        ),
                      ),
                      expandedHeight: 120,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text("No game data yet..."),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ]),
                );
              }

              // If there is game data, we work as normal
              //gameData = values["data"]["game"];
              game = GameData(values["data"]["game"]);

              // DatabaseReference pbpFeed =
              //     FirebaseDatabase.instance.ref('gamePbp22/${gameId}');

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
                        child: getGameHeader(widget.game, game)),
                    expandedHeight: 120,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          // gameStatus == 1
                          //     ? SizedBox() // Replace with HowToWatch widget if status is 1 or 2
                          //     : GameFeedMain(gameId, gameData, stats),

                          showPbp ? GameFeedMain(gameId, game) : SizedBox(),
                          showChat ? ChatFeed(gameId, game) : SizedBox(),
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
              return gameStatus > 1
                  ? ElevatedButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => GameView(game: gameData)),
                        // );
                        var date = gameData["homeStartDate"];
                        //getPbpData(date, gameId);
                      },
                      child: Text("Refresh"))
                  : SizedBox();
            }
          }),
      //floatingActionButton: _buildFab(context, game),
    );
  }

  Widget getGameHeader(dynamic game, GameData gameData) {
    if (game["gameStatus"] == 1) {
      return ScheduledGameHeader(
        gameData: game,
      );
    } else if (game["gameStatus"] == 2) {
      return Column(children: [
        InProgressGameHeader(
          game: game,
          gameData: gameData,
        ),
        WinProbability(gameId: game["gameId"]),
      ]);
    } else if (game["gameStatus"] == 3) {
      return InProgressGameHeader(
        game: game,
        gameData: gameData,
      );
    }

    return null;
  }

  Widget _buildFab(BuildContext context, GameData game) {
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
                builder: (context) => GameStatsView(gameData, gameId, game)),
          );
        } else if (index == 3) {
          // chat
          showDialog(
              context: context,
              builder: (context) {
                return GameFeedChatPopup(
                  gameId: gameId,
                  vTeamId: game.awayTeam.teamId,
                  hTeamId: game.homeTeam.teamId,
                );
              });
        }
      },
    );
  }

  void _update(int count) {
    setState(() => {});
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: const Text('snack'),
    //   duration: const Duration(seconds: 5),
    //   action: SnackBarAction(
    //     label: 'ACTION',
    //     onPressed: () {},
    //   ),
    // ));
  }

  // Future<dynamic> loadGameData() async {
  //   String gameId = widget.game["gameId"];
  //   String gameUrlCode = widget.game["gameCode"];
  //   String gameDate = gameUrlCode.split("/")[0];
  //   print('game_view network call');
  //   return await Network.getJson(Urls.nbaBoxScore(gameDate, gameId));
  // }

  // String formatDate(String date) {
  //   String d = "";

  //   var dt = DateTime.parse(date);
  //   d = "${dt.month}-${dt.day}-${dt.year}";

  //   return d;
  // }

  // Widget getTicketsCard() {
  //   return Card(
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Column(
  //         children: [
  //           Text("GET TICKETS", style: TextStyle(fontWeight: FontWeight.bold)),
  //           Container(
  //               padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
  //               child: Text(
  //                 //widget.game["tickets"]["mobileApp"],
  //                 'Coming Soon',
  //                 style: TextStyle(fontSize: 12),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // String getNewsSearchString(dynamic gameData) {
  //   var vTeamName = ConstantHelper.getTeamName(gameData["awayTeam"]["teamId"]);
  //   var hTeamName = ConstantHelper.getTeamName(gameData["homeTeam"]["teamId"]);

  //   var search = "nba game " +
  //       vTeamName +
  //       " at " +
  //       hTeamName +
  //       " " +
  //       gameData["startDateEastern"];

  //   return search;
  // }

  // String getTwitterSearchString(dynamic gameData) {
  //   var vTeamName = ConstantHelper.getTeamName(gameData["awayTeam"]["teamId"]);
  //   var hTeamName = ConstantHelper.getTeamName(gameData["homeTeam"]["teamId"]);

  //   var search = vTeamName + " " + hTeamName;

  //   return search;
  // }

  // int getStartCountdown(dynamic game) {
  //   String startTimeUTC = game["startTimeUTC"];

  //   if (startTimeUTC == "") {
  //     return null;
  //   }

  //   DateTime start = DateTime.parse(startTimeUTC);
  //   Duration duration = start.difference(DateTime.now());

  //   return duration.inMinutes;
  // }

  // Future<void> getPbpData(String date, String gameId) async {
  //   // If the play-by-play doesn't yet exist for this game (and it's already started) then
  //   // this method lets the user kick off loading the data from the url endpoint below and then saving it to the
  //   // gameFeed22 DB in firebase. However, it's pulling from the old endpoint so I need to
  //   // update it to get from the new one.
  //   var currentPeriod = gameData["period"];

  //   for (int i = 1; i <= currentPeriod; i++) {
  //     var _pbpFeed =
  //         await Network.getJson(Urls.nbaPlayByPlay(date, gameId, i.toString()));
  //     //print(_pbpFeed);
  //     var plays = _pbpFeed["plays"];

  //     if (plays.length > 0) {
  //       for (int j = 0; j < plays.length; j++) {
  //         print(plays[j]);
  //         var pbp = plays[j];

  //         DatabaseReference pbpFeed = FirebaseDatabase.instance.ref(
  //             'gameFeed22/' +
  //                 gameId +
  //                 '/' +
  //                 DateTime.now().millisecondsSinceEpoch.toString());

  //         pbpFeed.set({
  //           "type": "1",
  //           "period": i,
  //           "clock": pbp["clock"],
  //           "description": pbp["description"],
  //           "hTeamScore": pbp["hTeamScore"],
  //           "vTeamScore": pbp["vTeamScore"],
  //           "eventMsgType": pbp["eventMsgType"],
  //           "personId": pbp["personId"],
  //           "teamId": pbp["teamId"],
  //           "isScoreChange": pbp["isScoreChange"],
  //           "isVideoAvailable": pbp["isVideoAvailable"],
  //           "formatted": pbp["formatted"]
  //         });
  //       }
  //     }
  //   }
  // }

  // void populateGameData(String gameId, dynamic gameData) async {
  //   var dt = gameData["gameEt"].toString().split("T")[0];

  //   var games = await Network.getJson(
  //     Urls.nbaGamesSelectedDate(dt),
  //     requestHeaders: RequestHeaders.nbaStatsHeaders,
  //   );

  //   var _gameData;

  //   if (games != null) {
  //     for (var g in games["scoreboard"]["games"]) {
  //       if (g["gameId"].toString() == gameId) {
  //         _gameData = g;
  //       }
  //     }
  //   }

  //   DatabaseReference gameDb =
  //       FirebaseDatabase.instance.ref('gameData22/' + gameId);

  //   gameDb.set({"data": _gameData});
  // }
}
