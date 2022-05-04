import 'package:flutter/material.dart';
import 'package:hoop/components/dashboard_widgets/dashboard_section_box.dart';
import 'package:hoop/components/social_widgets/twitter_feed.dart';
import 'package:hoop/components/social_widgets/twitter_feed_small.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/screens/views/account/account_main.dart';
import 'package:hoop/screens/views/account/updates_main.dart';
import 'package:hoop/screens/views/account/user_main.dart';
import 'package:hoop/screens/views/games/today_games.dart';
import 'package:hoop/screens/views/games/today_games_small.dart';
import 'package:hoop/screens/views/help_glossary.dart';
import 'package:hoop/screens/views/news/news_feed_small.dart';
import 'package:hoop/screens/views/news/news_main.dart';
import 'package:hoop/screens/views/players/player_search.dart';
import 'package:hoop/screens/views/standings/standings.dart';
import 'package:hoop/screens/views/standings/standings_small.dart';
import 'package:hoop/screens/views/stats/leaders_main.dart';
import 'package:hoop/screens/views/stats/leaders_today_small.dart';
import 'package:hoop/screens/views/stats/league_stats.dart';
import 'package:hoop/screens/views/stats/league_stats_small.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
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
                            color: Colors.blue[800],
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.red, width: 3))),
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.amber[200]),
                          child: Center(
                            child: Text("Version 0.1",
                                style: TextStyle(fontSize: 10)),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HelpGlossary()));
                                },
                                icon: Icon(
                                  Icons.help_outline_outlined,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerSearch()));
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
                                          builder: (context) => UpdatesMain()));
                                },
                                icon: Icon(
                                  Icons.notification_important_outlined,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccountMain()))
                                      .then((value) => setState(() {}));
                                },
                                icon: user.email == null
                                    ? Icon(Icons.account_box_outlined)
                                    : Icon(
                                        Icons.account_box,
                                        color: Colors.blue,
                                      )),
                          ]),
                    ])),
                SizedBox(
                  height: 12,
                ),
                DashboardSectionBox(
                  dashboardWidget: TodaysGamesSmall(),
                  iconData: FontAwesomeIcons.basketballBall,
                  linkWidget: TodaysGames(),
                  sectionTitle: "Games",
                  tapMoreText: "Tap to view full game schedule...",
                ),
                SizedBox(
                  height: 12,
                ),
                DashboardSectionBox(
                  dashboardWidget: StandingsSmall(),
                  iconData: Icons.bar_chart,
                  linkWidget: Standings(),
                  sectionTitle: "Standings",
                  tapMoreText: "Tap to view full standings...",
                ),
                SizedBox(
                  height: 12,
                ),
                // DashboardSectionBox(
                //   dashboardWidget:
                //       TwitterFeedSmall(searchTerms: "nba basketball"),
                //   iconData: Icons.social_distance,
                //   linkWidget: TwitterFeed(searchTerms: "nba basketball"),
                //   sectionTitle: "Social",
                //   tapMoreText: "Tap to view more...",
                // ),
                // SizedBox(
                //   height: 12,
                // ),
                DashboardSectionBox(
                  dashboardWidget: LeadersTodaySmall(),
                  iconData: Icons.star,
                  linkWidget: LeadersMain(),
                  sectionTitle: "Leaders",
                  tapMoreText: "Tap to view more leaders...",
                ),
                SizedBox(
                  height: 12,
                ),
                DashboardSectionBox(
                  dashboardWidget: LeagueStatsSmall(),
                  iconData: Icons.leaderboard,
                  linkWidget: LeagueStats(),
                  sectionTitle: "Stats",
                  tapMoreText: "Tap to view League Stats...",
                ),
                SizedBox(
                  height: 12,
                ),
                DashboardSectionBox(
                  dashboardWidget: NbaNewsFeedSmall(),
                  iconData: FontAwesomeIcons.newspaper,
                  linkWidget: NewsMainScreen(),
                  sectionTitle: "Media",
                  tapMoreText: "Tap to view league-related news and media...",
                ),
                SizedBox(
                  height: 12,
                ),
                // DashboardSectionBox(
                //   dashboardWidget:
                //       TwitterFeedSmall(searchTerms: "nba basketball"),
                //   iconData: FontAwesomeIcons.twitterSquare,
                //   secondIcon: FontAwesomeIcons.facebookSquare,
                //   linkWidget: TwitterFeed(searchTerms: "nba basketball"),
                //   sectionTitle: "Social",
                //   tapMoreText: "Tap to view more...",
                // ),
                // SizedBox(
                //   height: 12,
                // ),
              ],
            ),
          )),
    );
  }
}
