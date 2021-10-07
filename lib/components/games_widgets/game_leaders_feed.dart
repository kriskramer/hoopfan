import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/games_widgets/game_leader_card.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GameLeadersFeed extends StatefulWidget {
  //final dynamic stats;
  final dynamic game;

  GameLeadersFeed({this.game});
  @override
  _GameLeadersFeedState createState() => _GameLeadersFeedState();
}

class _GameLeadersFeedState extends State<GameLeadersFeed> {
  Timer _timer;
  int _currentIndex = 0;
  List<Widget> leaders = [];
  Future<dynamic> _gameData;
  dynamic stats;

  @override
  void initState() {
    super.initState();
    _gameData = loadStats();

    _timer = new Timer.periodic(Duration(seconds: 3), (t) {
      setState(() {
        _currentIndex++;
        if (_currentIndex == leaders.length) {
          _currentIndex = 0;
        }
      });
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
        future: _gameData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            leaders.clear();
            //print('reloading game_view data');
            var gameData = snapshot.data["basicGameData"];
            var stats = snapshot.data["stats"];

            dynamic hTeam = stats["hTeam"]["leaders"];
            dynamic vTeam = stats["vTeam"]["leaders"];
            int vTeamColor =
                ConstantHelper.getTeamColor(widget.game["vTeam"]["teamId"]);
            int hTeamColor =
                ConstantHelper.getTeamColor(widget.game["hTeam"]["teamId"]);
            int vTeamTextColor =
                ConstantHelper.getTeamTextColor(widget.game["vTeam"]["teamId"]);
            int hTeamTextColor =
                ConstantHelper.getTeamTextColor(widget.game["hTeam"]["teamId"]);
            String vTeamTriCode = gameData["vTeam"]["triCode"];
            String hTeamTriCode = gameData["hTeam"]["triCode"];

            for (int i = 0; i < vTeam["points"]["players"].length; i++) {
              leaders.add(GameLeaderCard(
                playerId: vTeam["points"]["players"].length > 0
                    ? vTeam["points"]["players"][i]["personId"]
                    : "",
                description: "Points",
                value: vTeam["points"]["value"].toString(),
                teamColor: vTeamColor,
                teamTextColor: vTeamTextColor,
                triCode: vTeamTriCode,
              ));
            }

            for (int i = 0; i < vTeam["assists"]["players"].length; i++) {
              leaders.add(GameLeaderCard(
                playerId: vTeam["assists"]["players"].length > 0
                    ? vTeam["assists"]["players"][i]["personId"]
                    : "",
                description: "Assists",
                value: vTeam["assists"]["value"].toString(),
                teamColor: vTeamColor,
                teamTextColor: vTeamTextColor,
                triCode: vTeamTriCode,
              ));
            }

            for (int i = 0; i < vTeam["rebounds"]["players"].length; i++) {
              leaders.add(
                GameLeaderCard(
                  playerId: vTeam["rebounds"]["players"].length > 0
                      ? vTeam["rebounds"]["players"][i]["personId"]
                      : "",
                  description: "Rebounds",
                  value: vTeam["rebounds"]["value"].toString(),
                  teamColor: vTeamColor,
                  teamTextColor: vTeamTextColor,
                  triCode: vTeamTriCode,
                ),
              );
            }

            for (int i = 0; i < hTeam["points"]["players"].length; i++) {
              leaders.add(GameLeaderCard(
                playerId: hTeam["points"]["players"].length > 0
                    ? hTeam["points"]["players"][i]["personId"]
                    : "",
                description: "Points",
                value: hTeam["points"]["value"].toString(),
                teamColor: hTeamColor,
                teamTextColor: hTeamTextColor,
                triCode: hTeamTriCode,
              ));
            }

            for (int i = 0; i < hTeam["assists"]["players"].length; i++) {
              leaders.add(GameLeaderCard(
                playerId: hTeam["assists"]["players"].length > 0
                    ? hTeam["assists"]["players"][i]["personId"]
                    : "",
                description: "Assists",
                value: hTeam["assists"]["value"].toString(),
                teamColor: hTeamColor,
                teamTextColor: hTeamTextColor,
                triCode: hTeamTriCode,
              ));
            }

            for (int i = 0; i < hTeam["rebounds"]["players"].length; i++) {
              leaders.add(GameLeaderCard(
                playerId: hTeam["rebounds"]["players"].length > 0
                    ? hTeam["rebounds"]["players"][i]["personId"]
                    : "",
                description: "Rebounds",
                value: hTeam["rebounds"]["value"].toString(),
                teamColor: hTeamColor,
                teamTextColor: hTeamTextColor,
                triCode: hTeamTriCode,
              ));
            }
            return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity < 0) {
                  setState(() {
                    _currentIndex++;
                    if (_currentIndex == leaders.length) {
                      _currentIndex = 0;
                    }
                  });
                } else {
                  setState(() {
                    _currentIndex--;
                    if (_currentIndex < 0) {
                      _currentIndex = leaders.length - 1;
                    }
                  });
                }
              },
              child: Container(
                height: 55,
                child: IndexedStack(
                  index: _currentIndex,
                  children: [...leaders],
                ),
              ),
            );
          } else {
            return NoConnection();
          }
        });
  }

  Future<dynamic> loadStats() async {
    String gameId = widget.game["gameId"];
    String gameUrlCode = widget.game["gameUrlCode"];
    String gameDate = gameUrlCode.split("/")[0];
    print('game_view network call');
    return await Network.getJson(Urls.nbaBoxScore(gameDate, gameId));
  }
}
