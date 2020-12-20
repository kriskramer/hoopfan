import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_leader_card.dart';

class GameLeadersFeed extends StatefulWidget {
  final dynamic stats;

  GameLeadersFeed({this.stats});
  @override
  _GameLeadersFeedState createState() => _GameLeadersFeedState();
}

class _GameLeadersFeedState extends State<GameLeadersFeed> {
  Timer _timer;
  int _currentIndex = 0;
  List<Widget> leaders = new List<Widget>();

  @override
  void initState() {
    super.initState();

    dynamic hTeam = widget.stats["hTeam"]["leaders"];
    dynamic vTeam = widget.stats["vTeam"]["leaders"];
    leaders.add(GameLeaderCard(
        playerId: vTeam["points"]["players"][0]["personId"],
        description: "Points",
        value: vTeam["points"]["value"].toString()));
    leaders.add(GameLeaderCard(
        playerId: vTeam["assists"]["players"].length > 0
            ? vTeam["assists"]["players"][0]["personId"]
            : "",
        description: "Assists",
        value: vTeam["assists"]["value"].toString()));
    leaders.add(
      GameLeaderCard(
          playerId: vTeam["rebounds"]["players"].length > 0
              ? vTeam["rebounds"]["players"][0]["personId"]
              : "",
          description: "Rebounds",
          value: vTeam["rebounds"]["value"].toString()),
    );
    leaders.add(GameLeaderCard(
        playerId: hTeam["points"]["players"][0]["personId"],
        description: "Points",
        value: hTeam["points"]["value"].toString()));
    leaders.add(GameLeaderCard(
        playerId: hTeam["assists"]["players"][0]["personId"],
        description: "Assists",
        value: hTeam["assists"]["value"].toString()));
    leaders.add(GameLeaderCard(
        playerId: hTeam["rebounds"]["players"][0]["personId"],
        description: "Rebounds",
        value: hTeam["rebounds"]["value"].toString()));

    _timer = new Timer.periodic(Duration(seconds: 5), (t) {
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
    return Container(
      child: IndexedStack(
        index: _currentIndex,
        children: [...leaders],
      ),
    );
  }
}
