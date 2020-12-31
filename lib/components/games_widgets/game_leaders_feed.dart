import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_leader_card.dart';
import 'package:hoop/constant.dart';

class GameLeadersFeed extends StatefulWidget {
  final dynamic stats;
  final dynamic game;

  GameLeadersFeed({this.stats, this.game});
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
    int vTeamColor =
        ConstantHelper.getTeamColor(widget.game["vTeam"]["teamId"]);
    int hTeamColor =
        ConstantHelper.getTeamColor(widget.game["hTeam"]["teamId"]);
    int vTeamTextColor =
        ConstantHelper.getTeamTextColor(widget.game["vTeam"]["teamId"]);
    int hTeamTextColor =
        ConstantHelper.getTeamTextColor(widget.game["hTeam"]["teamId"]);
    String vTeamTriCode = widget.game["vTeam"]["triCode"];
    String hTeamTriCode = widget.game["hTeam"]["triCode"];

    leaders.add(GameLeaderCard(
      playerId: vTeam["points"]["players"].length > 0
          ? vTeam["points"]["players"][0]["personId"]
          : "",,
      description: "Points",
      value: vTeam["points"]["value"].toString(),
      teamColor: vTeamColor,
      teamTextColor: vTeamTextColor,
      triCode: vTeamTriCode,
    ));
    leaders.add(GameLeaderCard(
      playerId: vTeam["assists"]["players"].length > 0
          ? vTeam["assists"]["players"][0]["personId"]
          : "",
      description: "Assists",
      value: vTeam["assists"]["value"].toString(),
      teamColor: vTeamColor,
      teamTextColor: vTeamTextColor,
      triCode: vTeamTriCode,
    ));
    leaders.add(
      GameLeaderCard(
        playerId: vTeam["rebounds"]["players"].length > 0
            ? vTeam["rebounds"]["players"][0]["personId"]
            : "",
        description: "Rebounds",
        value: vTeam["rebounds"]["value"].toString(),
        teamColor: vTeamColor,
        teamTextColor: vTeamTextColor,
        triCode: vTeamTriCode,
      ),
    );
    leaders.add(GameLeaderCard(
      playerId: hTeam["points"]["players"].length > 0
          ? hTeam["points"]["players"][0]["personId"]
          : "",
      description: "Points",
      value: hTeam["points"]["value"].toString(),
      teamColor: hTeamColor,
      teamTextColor: hTeamTextColor,
      triCode: hTeamTriCode,
    ));
    leaders.add(GameLeaderCard(
      playerId: hTeam["assists"]["players"].length > 0
          ? hTeam["assists"]["players"][0]["personId"]
          : "",
      description: "Assists",
      value: hTeam["assists"]["value"].toString(),
      teamColor: hTeamColor,
      teamTextColor: hTeamTextColor,
      triCode: hTeamTriCode,
    ));
    leaders.add(GameLeaderCard(
      playerId: hTeam["rebounds"]["players"].length > 0
          ? hTeam["rebounds"]["players"][0]["personId"]
          : "",
      description: "Rebounds",
      value: hTeam["rebounds"]["value"].toString(),
      teamColor: hTeamColor,
      teamTextColor: hTeamTextColor,
      triCode: hTeamTriCode,
    ));

    _timer = new Timer.periodic(Duration(seconds: 4), (t) {
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
