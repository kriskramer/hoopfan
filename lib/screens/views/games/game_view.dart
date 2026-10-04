import 'package:flutter/material.dart';
import 'package:hoop/components/game_feed_widgets/chat_feed.dart';
import 'package:hoop/components/game_feed_widgets/chat_feed_count.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_count.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_main.dart';
import 'package:hoop/components/games_widgets/fab_with_icons.dart';
import 'package:hoop/components/games_widgets/game_news_view.dart';
import 'package:hoop/components/games_widgets/game_stats_view.dart';
import 'package:hoop/components/games_widgets/headers/in_progress_game_header.dart';
import 'package:hoop/components/games_widgets/headers/scheduled_game_header.dart';
import 'package:hoop/components/games_widgets/win_prob.dart';
import 'package:hoop/models/game_data.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../../components/games_widgets/game_feed_chat_popup.dart';
import 'game_info_view.dart';

class GameView extends StatefulWidget {
  final dynamic game;
  //final dynamic gameData;

  GameView({this.game});

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
                    builder: (context) => GameStatsView(widget.game, gameId)),
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
              gameData = GameData(values["data"]["game"]);

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
                        child: getGameHeader(gameData, widget.game)),
                    expandedHeight: 120,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          // gameStatus == 1
                          //     ? SizedBox() // Replace with HowToWatch widget if status is 1 or 2
                          //     : GameFeedMain(gameId, gameData, stats),

                          showPbp ? GameFeedMain(gameId, gameData) : SizedBox(),
                          showChat ? ChatFeed(gameId, gameData) : SizedBox(),
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

  Widget getGameHeader(GameData gameData, dynamic game) {
    if (game != null) {
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
    }
    return null;
  }

// Save this code somewhere. This loads up the floating action button with sub buttons
  // Widget _buildFab(BuildContext context, GameData game) {
  //   final icons = [
  //     Icons.settings,
  //     Icons.article_outlined,
  //     Icons.sports_basketball,
  //     Icons.sms,
  //   ];

  //   return FabWithIcons(
  //     icons: icons,
  //     onIconTapped: (index) {
  //       if (index == 0) {
  //         // show game settings page
  //         showDialog(
  //             context: context,
  //             builder: (context) {
  //               return GameSettings(gameData, gameId, _update);
  //             });
  //       } else if (index == 1) {
  //         //show news page
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => GameNewsView(gameData, gameId)),
  //         );
  //       } else if (index == 2) {
  //         // show stats page
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => GameStatsView(gameData, gameId, game)),
  //         );
  //       } else if (index == 3) {
  //         // chat
  //         showDialog(
  //             context: context,
  //             builder: (context) {
  //               return GameFeedChatPopup(
  //                 gameId: gameId,
  //                 vTeamId: game.awayTeam.teamId,
  //                 hTeamId: game.homeTeam.teamId,
  //               );
  //             });
  //       }
  //     },
  //   );
  // }

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
}
