import 'package:flutter/material.dart';
import 'package:hoop/screens/views/account/account_main.dart';
import 'package:hoop/screens/views/games_view/today_games.dart';
import 'package:hoop/screens/views/league/league.dart';
import 'package:hoop/screens/views/news_view/news_main.dart';
import 'package:hoop/screens/views/stats/stats_main.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedScreen = 0;
  List<Widget> views = [
    //Standings(),
    LeagueMainView(),
    NewsMainScreen(),
    TodaysGames(),
    StatsMain(),
    //  AccountMain(),
  ];

  void onTapChangeView(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: views.elementAt(_selectedScreen),
        backgroundColor: Color(0XFFEDF1FF),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart_outlined),
              label: "League",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball_sharp),
              label: "Games",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(Icons.bar_chart),
              label: "Stats",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: "User",
            // ),
          ],
          currentIndex: _selectedScreen,
          onTap: onTapChangeView,
          selectedItemColor: Color(0XFF1F6BA3),
        ),
      ),
    );
  }
}
