import 'package:flutter/material.dart';

class TeamStatsLastNGames extends StatefulWidget {
  final String teamId;
  const TeamStatsLastNGames({this.teamId});

  @override
  _TeamStatsLastNGamesState createState() => _TeamStatsLastNGamesState();
}

class _TeamStatsLastNGamesState extends State<TeamStatsLastNGames> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Last N Games"));
  }
}
