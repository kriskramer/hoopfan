import 'package:flutter/material.dart';
import 'package:hoop/components/dashboard_widgets/dashboard_fab_with_icons.dart';
import 'package:hoop/components/dashboard_widgets/title_bar.dart';
import 'package:hoop/components/games_widgets/fab_with_icons.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/screens/views/games/today_games.dart';
import 'package:hoop/screens/views/games/today_games_dashboard.dart';
import 'package:hoop/screens/views/news/news_main.dart';
import 'package:hoop/screens/views/standings/standings.dart';
import 'package:hoop/screens/views/stats/leaders_main.dart';
import 'package:hoop/screens/views/stats/league_stats.dart';
import 'package:provider/provider.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain();

  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  @override
  Widget build(BuildContext context) {
    AppUser user = Provider.of<UserProv>(context, listen: false).getUser();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TitleBar(),
              SizedBox(
                height: 10,
              ),
              TodaysGamesDashboard(),
              SizedBox(
                height: 25,
              ),
            ],
          )),
      //floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [
      Icons.calendar_month,
      Icons.list,
      Icons.leaderboard,
      Icons.stacked_bar_chart,
      Icons.article
    ];

    return DashboardFabWithIcons(
      icons: icons,
      onIconTapped: (index) {
        if (index == 0) {
          // show main page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodaysGames()));
        } else if (index == 1) {
          //show standings page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Standings()));
        } else if (index == 2) {
          // show stats page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LeadersMain()));
        } else if (index == 3) {
          // chat
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LeagueStats()));
        } else if (index == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsMainScreen()));
        }
      },
    );
  }
}
