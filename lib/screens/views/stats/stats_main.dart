import 'package:flutter/material.dart';
import 'package:hoop/screens/views/stats/stats_teams.dart';
import 'package:hoop/screens/views/stats/stats_today.dart';

class StatsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF1F6BA3),
            automaticallyImplyLeading: false, // hides back arrow button
            toolbarHeight: 50,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Teams",
                ),
                Tab(
                  text: "Players",
                ),
                Tab(
                  text: "Today",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(child: StatsTeams()),
              SingleChildScrollView(
                child: Text('PLayers'),
              ),
              SingleChildScrollView(child: StatsToday())
            ],
          )),
    );
  }
}
