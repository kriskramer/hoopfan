import 'package:flutter/material.dart';
import 'package:hoop/screens/views/stats/stats_players.dart';
import 'package:hoop/screens/views/stats/stats_teams.dart';
import 'package:hoop/screens/views/stats/leaders_today.dart';

class LeadersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF1F6BA3),
            toolbarHeight: 30,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Today",
                ),
                Tab(
                  text: "Teams",
                ),
                Tab(
                  text: "Players",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(child: LeadersToday()),
              SingleChildScrollView(child: StatsTeams()),
              SingleChildScrollView(child: StatsPlayers()),
            ],
          )),
    );
  }
}
