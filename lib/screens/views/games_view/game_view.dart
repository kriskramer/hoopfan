import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/games_widgets/game_box_score.dart';
import 'package:hoop/components/games_widgets/game_foul_trouble_feed.dart';
import 'package:hoop/components/games_widgets/game_lead_chart_small.dart';
import 'package:hoop/components/games_widgets/game_leader_card.dart';
import 'package:hoop/components/games_widgets/game_leaders_feed.dart';
import 'package:hoop/components/games_widgets/game_officials.dart';
import 'package:hoop/components/games_widgets/game_pbp_feed.dart';
import 'package:hoop/components/games_widgets/game_stats.dart';
import 'package:hoop/components/games_widgets/on_court_card.dart';
import 'package:hoop/components/games_widgets/quarter_scores.dart';
import 'package:hoop/components/social_widgets/twitter_feed.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/games_view/game_pbp.dart';
import 'package:hoop/screens/views/games_view/game_preview_article.dart';
import 'package:hoop/screens/views/games_view/game_recap_article.dart';
import 'package:hoop/screens/views/teams_view/teaminfo.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GameView extends StatefulWidget {
  final dynamic game;

  GameView({this.game});

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Future<dynamic> _gameData;
  Timer _timer;
  int timerDuration = 45;

  @override
  void initState() {
    super.initState();
    _gameData = loadGameData();
    // TODO: Can't figure out the timer... it runs fine a few times, then just seems to crash the app.
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
    // String gameId = widget.game["gameId"];
    // String gameUrlCode = widget.game["gameUrlCode"];
    // String gameDate = gameUrlCode.split("/")[0];

    return Scaffold(
      appBar: AppBar(
        title: Text("Game Details"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              refreshGameData();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _gameData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                //print('reloading game_view data');
                var gameData = snapshot.data["basicGameData"];
                var stats = snapshot.data["stats"];

                // var vScore = gameData["vTeam"]["score"] == ""
                //     ? "0"
                //     : gameData["vTeam"]["score"];
                // var hScore = gameData["hTeam"]["score"] == ""
                //     ? "0"
                //     : gameData["hTeam"]["score"];
                var arena = gameData["arena"]["name"];
                var arenaLoc = gameData["arena"]["city"] +
                    " " +
                    gameData["arena"]["stateAbbr"];
                //var clock = gameData["clock"];

                bool preview = gameData["isPreviewArticleAvail"];
                bool recap = gameData["isRecapArticleAvail"];

                var gameStatus = gameData["statusNum"];
                var gameActivated = gameData["isGameActivated"];

                var gameId = gameData["gameId"];
                var date = gameData["gameUrlCode"].toString().split("/")[0];
                // var currentPeriod = gameData["period"]["current"];

                if (gameData["isGameActivated"]) {
                  timerDuration = 45;
                } else {
                  _timer.cancel();
                }

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      padding: EdgeInsets.all(4),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          gameData["seasonStageId"] == 1
                              ? "Pre Season"
                              : "Regular Season",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    gameStatus > 1 || gameActivated
                        ? inProgressGameHeader(gameData, stats)
                        : scheduledGameHeader(gameData),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          arena,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          arenaLoc,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    stats == null
                        ? Row(
                            children: [
                              preview
                                  ? FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GamePreviewArticle(
                                              gameDate: date,
                                              gameId: gameId,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text('Preview',
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  : Text(''),
                              recap
                                  ? FlatButton(
                                      onPressed: () {},
                                      child: Text('Recap',
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  : Text(''),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              preview
                                  ? FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GamePreviewArticle(
                                              gameDate: date,
                                              gameId: gameId,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text('Preview',
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  : Text(''),
                              Text(
                                'Lead Changes: ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                stats["leadChanges"],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Ties: ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                stats["timesTied"],
                                style: TextStyle(fontSize: 18),
                              ),
                              recap
                                  ? FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GameRecapArticle(
                                              gameDate: date,
                                              gameId: gameId,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text('Recap',
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  : Text(''),
                            ],
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    gameStatus == 1
                        ? SizedBox() // Replace with HowToWatch widget if status is 1 or 2
                        : DefaultTabController(
                            length: 5, // length of tabs
                            initialIndex: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: TabBar(
                                    labelColor: Colors.green,
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      Tab(text: 'Feed'),
                                      Tab(text: gameData["vTeam"]["triCode"]),
                                      Tab(text: gameData["hTeam"]["triCode"]),
                                      Tab(text: 'Stats'),
                                      Tab(text: 'Odds'),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1200, //height of TabBarView
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 0.5))),
                                  child: TabBarView(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Column(children: [
                                          Container(
                                            padding: EdgeInsets.all(15),
                                            child: OnCourtCard(
                                              stats: stats,
                                              game: gameData,
                                            ),
                                          ),
                                          QuarterScores(
                                            game: gameData,
                                          ),
                                          GameLeadersFeed(
                                            stats: stats,
                                            game: gameData,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          GamePbpFeed(
                                            gameData: gameData,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          GameFoulTroubleFeed(
                                              game: gameData, stats: stats),
                                        ]),
                                      ),
                                      Container(
                                        child: GameBoxScore(
                                          game: gameData,
                                          stats: stats,
                                          isHomeTeam: false,
                                        ),
                                      ),
                                      Container(
                                        child: GameBoxScore(
                                          game: gameData,
                                          stats: stats,
                                          isHomeTeam: true,
                                        ),
                                      ),
                                      Container(
                                        child: GameStats(
                                          stats: stats,
                                          gameData: gameData,
                                        ),
                                      ),
                                      Container(child: Text('Odds'))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                    GameOfficials(
                      game: gameData,
                    ),
                    gameStatus < 3 ? hotToWatchCard() : Text(''),
                  ],
                );
              } else {
                return NoConnection();
              }
            }),
      ),
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

  Widget hotToWatchCard() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("HOW TO WATCH", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: Text(
                  getHowToWatchBroadcast(widget.game),
                  style: TextStyle(fontSize: 12),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 12),
                child: Text(
                  getHowToWatchAudio(widget.game),
                  style: TextStyle(fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }

  String getHowToWatchBroadcast(dynamic game) {
    String howToWatch = "";
    String nat, v, h;

    if (game["watch"]["broadcast"]["broadcasters"]["national"].length > 0) {
      nat =
          game["watch"]["broadcast"]["broadcasters"]["national"][0]["longName"];
    } else {
      nat = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["hTeam"].length > 0) {
      h = game["watch"]["broadcast"]["broadcasters"]["hTeam"][0]["longName"];
    } else {
      h = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["vTeam"].length > 0) {
      v = game["watch"]["broadcast"]["broadcasters"]["vTeam"][0]["longName"];
    } else {
      v = "";
    }

    howToWatch =
        "Broadcast: ${nat == "" ? "" : nat + ",  "}${v == "" ? "" : v + ",  "}$h";

    return howToWatch;
  }

  String getHowToWatchAudio(dynamic game) {
    String howToWatch = "";
    String nat, v, h;

    if (game["watch"]["broadcast"]["audio"]["national"]["broadcasters"].length >
        0) {
      nat = game["watch"]["broadcast"]["audio"]["national"]["broadcasters"][0]
          ["longName"];
    } else {
      nat = "";
    }
    if (game["watch"]["broadcast"]["audio"]["hTeam"]["broadcasters"].length >
        0) {
      h = game["watch"]["broadcast"]["audio"]["hTeam"]["broadcasters"][0]
          ["longName"];
    } else {
      h = "";
    }
    if (game["watch"]["broadcast"]["audio"]["vTeam"]["broadcasters"].length >
        0) {
      v = game["watch"]["broadcast"]["audio"]["vTeam"]["broadcasters"][0]
          ["longName"];
    } else {
      v = "";
    }

    howToWatch =
        "Radio: ${nat == "" ? "" : nat + ",  "}${v == "" ? "" : v + ",  "}$h";

    return howToWatch;
  }

  String getCurrentPeriod(dynamic json) {
    var period = json["period"]["current"];
    var periodString = "";
    var clock = json["clock"];
    var isHalftime = json["period"]["isHalftime"];
    var clockString = "";

    if (period == 1) {
      periodString = "1st";
    } else if (period == 2) {
      periodString = "2nd";
    } else if (period == 3) {
      periodString = "3rd";
    } else if (period == 4) {
      periodString = "4th";
    } else if (period > 4) {
      periodString = "OT";
    }

    if (isHalftime) {
      clockString = "Halftime";
    } else {
      clockString = periodString + "  " + clock;
    }

    return clockString;
  }

  Widget scheduledGameHeader(dynamic gameData) {
    var seriesWin = gameData["vTeam"]["seriesWin"] == ""
        ? "0"
        : gameData["vTeam"]["seriesWin"];
    var seriesLoss = gameData["vTeam"]["seriesLoss"] == ""
        ? "0"
        : gameData["vTeam"]["seriesLoss"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 40,
                url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"])),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: gameData["vTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["vTeam"]["triCode"]} (${gameData["vTeam"]["win"]} - ${gameData["vTeam"]["loss"]})",
            style: TextStyle(fontSize: 18),
          ),
        ]),
        Column(children: [
          Text(formatDate(gameData["startDateEastern"]),
              style: TextStyle(fontSize: 18)),
          Text(gameData["startTimeEastern"], style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 5,
          ),
          Text("Series ($seriesWin - $seriesLoss)"),
          SizedBox(
            height: 5,
          ),
          Text(gameData["arena"]["name"]),
          Text(gameData["arena"]["city"]),
        ]),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 40,
                url: ConstantHelper.getTeamLogo(gameData["hTeam"]["teamId"])),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: gameData["hTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["hTeam"]["triCode"]} (${gameData["hTeam"]["win"]} - ${gameData["hTeam"]["loss"]})",
            style: TextStyle(fontSize: 18),
          ),
        ]),
      ],
    );
  }

  Widget inProgressGameHeader(dynamic gameData, dynamic stats) {
    var vScore =
        gameData["vTeam"]["score"] == "" ? "0" : gameData["vTeam"]["score"];
    var hScore =
        gameData["hTeam"]["score"] == "" ? "0" : gameData["hTeam"]["score"];
    var vFullTimeouts = stats["vTeam"]["totals"]["full_timeout_remaining"];
    var vShortTimeouts = stats["vTeam"]["totals"]["short_timeout_remaining"];
    var hFullTimeouts = stats["hTeam"]["totals"]["full_timeout_remaining"];
    var hShortTimeouts = stats["hTeam"]["totals"]["short_timeout_remaining"];
    // var arena = gameData["arena"]["name"];
    // var arenaLoc =
    //     gameData["arena"]["city"] + " " + gameData["arena"]["stateAbbr"];
    var seriesWin = gameData["vTeam"]["seriesWin"] == ""
        ? "0"
        : gameData["vTeam"]["seriesWin"];
    var seriesLoss = gameData["vTeam"]["seriesLoss"] == ""
        ? "0"
        : gameData["vTeam"]["seriesLoss"];

    var gameStatus = gameData["statusNum"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 10,
        ),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 30,
                url: ConstantHelper.getTeamLogo(gameData["vTeam"]["teamId"])),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: gameData["vTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["vTeam"]["triCode"]} (${gameData["vTeam"]["win"]} - ${gameData["vTeam"]["loss"]})",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          // THis shows the available timeouts
          Row(
            children: [
              for (int i = 0; i < int.parse(vFullTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    minRadius: 4,
                  ),
                ),
              for (int i = 0; i < int.parse(vShortTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    minRadius: 3,
                  ),
                ),
            ],
          )
        ]),
        Column(children: [
          Text(
            "$vScore - $hScore",
            style: TextStyle(fontSize: 36, color: Colors.red),
          ),
          gameStatus == 2
              ? Text(getCurrentPeriod(gameData), style: TextStyle(fontSize: 24))
              : gameStatus == 3
                  ? Text('Final', style: TextStyle(fontSize: 24))
                  : Text(''),
          SizedBox(
            height: 5,
          ),
          Text("Series ($seriesWin - $seriesLoss)"),
        ]),
        Column(children: [
          GestureDetector(
            child: CachedLogo(
                radius: 30,
                url: ConstantHelper.getTeamLogo(gameData["hTeam"]["teamId"])),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetails(nbaTeamId: gameData["hTeam"]["teamId"])));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${gameData["hTeam"]["triCode"]} (${gameData["hTeam"]["win"]} - ${gameData["hTeam"]["loss"]})",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              for (int i = 0; i < int.parse(hFullTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    minRadius: 4,
                  ),
                ),
              for (int i = 0; i < int.parse(hShortTimeouts); i++)
                Container(
                  margin: EdgeInsets.all(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    minRadius: 3,
                  ),
                ),
            ],
          )
        ]),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
