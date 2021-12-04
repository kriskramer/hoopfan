import 'package:flutter/material.dart';
import 'package:hoop/components/dashboard_widgets/dashboard_section_box.dart';
import 'package:hoop/screens/views/account/account_main.dart';
import 'package:hoop/screens/views/games/today_games.dart';
import 'package:hoop/screens/views/games/today_games_small.dart';
import 'package:hoop/screens/views/news/news_feed_small.dart';
import 'package:hoop/screens/views/news/news_main.dart';
import 'package:hoop/screens/views/players/player_search.dart';
import 'package:hoop/screens/views/standings/standings.dart';
import 'package:hoop/screens/views/standings/standings_small.dart';
import 'package:hoop/screens/views/stats/stats_main.dart';
import 'package:hoop/screens/views/stats/stats_today_small.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain();

  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                //height: 75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black))),
                child: Column(children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 22,
                                child: Image.asset('images/bball.png')),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Hoop Fan",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlayerSearch()));
                            },
                            icon: Icon(Icons.search)),
                        Text("Dashboard",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountMain()));
                            },
                            icon: Icon(
                              Icons.account_box_outlined,
                            )),
                      ]),
                ])),
            SizedBox(
              height: 12,
            ),
            DashboardSectionBox(
              dashboardWidget: TodaysGamesSmall(),
              iconData: Icons.sports_basketball_rounded,
              linkWidget: TodaysGames(),
              sectionTitle: "Games",
              tapMoreText: "Tap to view full game schedule...",
            ),
            SizedBox(
              height: 12,
            ),
            DashboardSectionBox(
              dashboardWidget: NbaNewsFeedSmall(),
              iconData: Icons.video_collection_sharp,
              linkWidget: NewsMainScreen(),
              sectionTitle: "Media",
              tapMoreText: "Tap to view team-related media...",
            ),
            SizedBox(
              height: 12,
            ),
            DashboardSectionBox(
              dashboardWidget: StandingsSmall(),
              iconData: Icons.video_collection_sharp,
              linkWidget: Standings(),
              sectionTitle: "Standings",
              tapMoreText: "Tap to view full standings...",
            ),
            SizedBox(
              height: 12,
            ),
            DashboardSectionBox(
              dashboardWidget: StatsTodaySmall(),
              iconData: Icons.video_collection_sharp,
              linkWidget: StatsMain(),
              sectionTitle: "Leaders",
              tapMoreText: "Tap to view more leaders...",
            ),
            SizedBox(
              height: 12,
            ),
            DashboardSectionBox(
              dashboardWidget: SizedBox(height: 120),
              iconData: Icons.video_collection_sharp,
              linkWidget: null,
              sectionTitle: "Stats",
              tapMoreText: "Tap to view league stats...",
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      )),
    );
  }
}
