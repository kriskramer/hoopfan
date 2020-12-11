import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
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
  @override
  Widget build(BuildContext context) {
    String gameId = widget.game["gameId"];
    String gameUrlCode = widget.game["gameUrlCode"];
    String gameDate = gameUrlCode.split("/")[0];

    return Scaffold(
      appBar: AppBar(
        title: Text("Game Details"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: Network.getJson(Urls.nbaBoxScore(gameDate, gameId)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var gameData = snapshot.data["basicGameData"];
                var vScore = gameData["vTeam"]["score"] == ""
                    ? "0"
                    : gameData["vTeam"]["score"];
                var hScore = gameData["hTeam"]["score"] == ""
                    ? "0"
                    : gameData["hTeam"]["score"];
                var arena = gameData["arena"]["name"];
                var arenaLoc = gameData["arena"]["city"] +
                    " " +
                    gameData["arena"]["stateAbbr"];
                var clock =
                    gameData["clock"] == "" ? "Not started" : gameData["clock"];

                return Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          GestureDetector(
                            child: CachedLogo(
                                radius: 40,
                                url: ConstantHelper.getTeamLogo(
                                    gameData["vTeam"]["teamId"])),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TeamDetails(
                                          nbaTeamId: gameData["vTeam"]
                                              ["teamId"])));
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
                          Text(gameData["startTimeEastern"],
                              style: TextStyle(fontSize: 18)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(arena),
                          Text(arenaLoc),
                        ]),
                        Column(children: [
                          GestureDetector(
                            child: CachedLogo(
                                radius: 40,
                                url: ConstantHelper.getTeamLogo(
                                    gameData["hTeam"]["teamId"])),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TeamDetails(
                                          nbaTeamId: gameData["hTeam"]
                                              ["teamId"])));
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      padding: EdgeInsets.all(4),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          gameData["seasonStageId"] == 1
                              ? "Pre Season"
                              : "Regular Season",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text(
                            "$vScore - $hScore",
                            style: TextStyle(fontSize: 36),
                          ),
                          Text(
                            clock,
                            style: TextStyle(fontSize: 24),
                          )
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Column(
                        children: [
                          Text("How to watch"),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return NoConnection();
              }
            }),
      ),
    );
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }
}
