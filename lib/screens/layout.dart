import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/models/season_model.dart';
import 'package:hoop/providers/user_prov.dart';
//import 'package:hoop/screens/views/account/account_main.dart';
import 'package:hoop/screens/views/dashboard_main.dart';
//import 'package:hoop/screens/views/games/today_games.dart';
//import 'package:hoop/screens/views/league/league.dart';
//import 'package:hoop/screens/views/news/news_main.dart';
//import 'package:hoop/screens/views/stats/stats_main.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // int _selectedScreen = 0;
  // List<Widget> views = [
  //   LeagueMainView(),
  //   NewsMainScreen(),
  //   TodaysGames(),
  //   LeadersMain(),
  //   AccountMain(),
  // ];

  // void onTapChangeView(int index) {
  //   setState(() {
  //     _selectedScreen = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == true) {
            return SafeArea(
              child: Scaffold(
                //body: views.elementAt(_selectedScreen),
                body: DashboardMain(),
                backgroundColor: Color(0XFFEDF1FF),
                // bottomNavigationBar: BottomNavigationBar(
                //   type: BottomNavigationBarType.fixed,
                //   items: const <BottomNavigationBarItem>[
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.table_chart_outlined),
                //       label: "League",
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.article),
                //       label: "News",
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.sports_basketball_sharp),
                //       label: "Games",
                //     ),
                //     BottomNavigationBarItem(
                //       backgroundColor: Colors.blueGrey,
                //       icon: Icon(Icons.bar_chart),
                //       label: "Stats",
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.person),
                //       label: "User",
                //     ),
                //   ],
                //   currentIndex: _selectedScreen,
                //   onTap: onTapChangeView,
                //   selectedItemColor: Color(0XFF1F6BA3),
                // ),
              ),
            );
          } else {
            return NoConnection();
          }
        });
  }

  Future<bool> loadData() async {
    bool complete = false;
    // standingsList =
    //     Provider.of<JsonFiles>(context, listen: false).getLeagueStandings();

    if (Provider.of<JsonFiles>(context, listen: false).getLeagueStandings() ==
        null) {
      try {
        var newStandings = await Network.getJson(
          Urls.getNbaStatsLeagueStandings(
              season: Provider.of<SeasonProv>(context, listen: false).season),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );
        var players = await Network.getJson(Urls.nbaAllPlayers());
        var teams = await Network.getJson(Urls.nbaAllTeams());

        dynamic baseTeamStats = await Network.getJson(
          Urls.getNbaStatsTeamStatisticsBase(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        dynamic advancedTeamStats = await Network.getJson(
          Urls.getNbaStatsTeamStatisticsAdvanced(),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false)
            .setBaseTeamStats(baseTeamStats);
        Provider.of<JsonFiles>(context, listen: false)
            .setAdvancedTeamStats(advancedTeamStats);

        //  standingsList = LeagueStandingList(newStandings);
        Provider.of<JsonFiles>(context, listen: false)
            .setLeagueStandings(LeagueStandingList(newStandings));

        Provider.of<JsonFiles>(context, listen: false).setAllPlayers(players);
        Provider.of<JsonFiles>(context, listen: false).setAllTeams(teams);

        Provider.of<JsonFiles>(context, listen: false)
            .setSelectedDate(DateTime.now());

        // Login the user automatically if they've logged in before
        final prefs = await SharedPreferences.getInstance();
        var user = prefs.getString("user");
        if (user != null) {
          AppUser u = AppUser.fromJson(json.decode(user));
          Provider.of<UserProv>(context, listen: false).setUser(u);
          // TODO: The above will set the user object in the provider, making the
          // app think the user is logged in, however, we should still ACTUALLY
          //log in the user here to show a record on the DB of it happening.

        }

        if (Provider.of<JsonFiles>(context, listen: false)
                .getLeagueStandings() !=
            null) {
          complete = true; // data gotten
        }
      } catch (e) {
        print(e);
      }
    } else {
      complete = true;
    }

    return complete;
  }
}
