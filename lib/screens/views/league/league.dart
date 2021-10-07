import 'package:flutter/material.dart';
import 'package:hoop/models/standing.dart';
import 'package:hoop/screens/views/standings_view/standings.dart';

class LeagueMainView extends StatelessWidget {
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
                  text: "Standings",
                ),
                Tab(
                  text: "2021-22",
                ),
                Tab(
                  text: "Search",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(child: Standings()),
              SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        'Set season to view. This feature is coming soon...')),
              ),
              SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child:
                        Text('Player Search. This feature is coming soon...')),
              ),
            ],
          )),
    );
  }
}
