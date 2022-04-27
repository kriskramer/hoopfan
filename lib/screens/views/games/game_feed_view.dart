import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/game_feed_widgets/game_feed_main.dart';
import 'package:hoop/components/games_widgets/arena_card.dart';
import 'package:hoop/components/games_widgets/fab_with_icons.dart';
import 'package:hoop/components/games_widgets/game_box_score_main.dart';
import 'package:hoop/components/games_widgets/game_foul_trouble_feed.dart';
import 'package:hoop/components/games_widgets/game_leaders_feed.dart';
import 'package:hoop/components/games_widgets/game_officials.dart';
import 'package:hoop/components/games_widgets/game_pbp_feed.dart';
import 'package:hoop/components/games_widgets/game_stats.dart';
import 'package:hoop/components/games_widgets/game_stats_popup.dart';
import 'package:hoop/components/games_widgets/how_to_watch_card.dart';
import 'package:hoop/components/games_widgets/in_progress_game_header.dart';
import 'package:hoop/components/games_widgets/on_court_card.dart';
import 'package:hoop/components/games_widgets/scheduled_game_header.dart';
import 'package:hoop/components/games_widgets/win_prob.dart';
import 'package:hoop/components/social_widgets/twitter_feed.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games/chat_main.dart';
import 'package:hoop/screens/views/games/game_preview_article.dart';
import 'package:hoop/screens/views/games/game_recap_article.dart';
import 'package:hoop/screens/views/stats/stats_teams.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

import '../../../components/games_widgets/game_player_popup.dart';

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
    _timer = new Timer.periodic(Duration(seconds: timerDuration), (Timer t) {
      refreshGameData();
      print('game_view timer tick');
    });
  }

  void refreshGameData() {
    setState(() {
      _gameData = loadGameData();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (vTeamScore == null) vTeamScore = widget.game["vTeam"]["score"];
    if (hTeamScore == null) hTeamScore = widget.game["hTeam"]["score"];
    var gameStatus = widget.game["statusNum"];

    return Scaffold(
      bottomNavigationBar: gameStatus > 1
          ? GameLeadersFeed(
              game: widget.game,
            )
          : SizedBox(),
      body: FutureBuilder(
          future: _gameData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              //print('reloading game_view data');
              gameData = snapshot.data["basicGameData"];
              stats = snapshot.data["stats"];

              var gameActivated = gameData["isGameActivated"];

              gameId = gameData["gameId"];
              date = gameData["gameUrlCode"].toString().split("/")[0];

              vTeamScore = gameData["vTeam"]["score"];
              hTeamScore = gameData["hTeam"]["score"];

              if (gameData["isGameActivated"]) {
                timerDuration = 30;
              } else {
                _timer.cancel();
              }
              return SafeArea(
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    iconTheme: IconThemeData(color: Colors.blue),
                    pinned: true,
                    elevation: 10,
                    collapsedHeight: 135,
                    backgroundColor: Colors.white,
                    flexibleSpace: Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: gameStatus > 1 || gameActivated
                          ? Column(children: [
                              InProgressGameHeader(
                                  gameData: gameData, stats: stats),
                              WinProbability(gameId: gameId)
                            ])
                          : ScheduledGameHeader(gameData: gameData),
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
                          gameStatus == 1
                              ? SizedBox() // Replace with HowToWatch widget if status is 1 or 2
                              : GameFeedMain(gameId, gameData, stats),
                          SizedBox(
                            height: 5,
                          ),
                          ArenaCard(
                            gameData: gameData,
                          ),
                          GameOfficials(
                            game: gameData,
                          ),
                          gameStatus < 3
                              ? HowToWatchCard(game: widget.game)
                              : Text(''),
                          gameStatus < 3 ? getTicketsCard() : Text('')
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
    final icons = [Icons.sms, Icons.mail, Icons.bar_chart_outlined];
    return FabWithIcons(
      icons: icons,
      onIconTapped: (index) {
        if (index == 0) {
          // chat
        } else if (index == 1) {
          // show game info page
        } else if (index == 2) {
          if (stats != null) {
            // show stats page
            showDialog(
                context: context,
                builder: (context) {
                  return GameStatsPopup(widget.game, stats);
                });
          }
        }
      },
    );
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
}
