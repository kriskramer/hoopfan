import 'package:flutter/material.dart';
import 'package:hoop/components/dashboard_widgets/dashboard_section_box.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/screens/views/account/account_main.dart';
import 'package:hoop/screens/views/games/today_games.dart';
import 'package:hoop/screens/views/games/today_games_dashboard.dart';
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
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.blue, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 20),
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
                            Row(
                              children: [
                                IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayerSearch()));
                                    },
                                    icon: Icon(Icons.search)),
                                IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => UpdatesMain()));
                                    },
                                    icon: Icon(
                                      Icons.notification_important_outlined,
                                    )),
                                IconButton(
                                    color: Colors.white,
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
                                            color: Colors.orange,
                                          )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 25,
                ),
                TodaysGamesDashboard(),
                ElevatedButton(
                  child: Text(
                    "Full Schedule",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodaysGames()),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                DashboardSectionBox(
                  dashboardWidget: StandingsSmall(),
                  iconData: Icons.bar_chart,
                  linkWidget: null,
                  sectionTitle: "Standings",
                  tapMoreText: "",
                ),
                ElevatedButton(
                  child: Text(
                    "All Standings",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Standings()),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
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
                  linkWidget: null,
                  sectionTitle: "Leaders",
                  tapMoreText: "",
                ),
                ElevatedButton(
                  child: Text(
                    "All Leaders",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LeadersMain()),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                DashboardSectionBox(
                  dashboardWidget: LeagueStatsSmall(),
                  iconData: Icons.leaderboard,
                  linkWidget: null,
                  sectionTitle: "Stats",
                  tapMoreText: "",
                ),
                ElevatedButton(
                  child: Text(
                    "More Stats",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LeagueStats()),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                DashboardSectionBox(
                  dashboardWidget: NbaNewsFeedSmall(),
                  iconData: FontAwesomeIcons.newspaper,
                  linkWidget: null,
                  sectionTitle: " Media",
                  tapMoreText: "",
                ),
                ElevatedButton(
                  child: Text(
                    "More News",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsMainScreen()),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
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
