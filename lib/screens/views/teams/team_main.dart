import 'package:hoop/components/cacheimg.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/dashboard_widgets/dashboard_section_box.dart';
import 'package:hoop/components/teams_widgets/team_leader_card.dart';
import 'package:hoop/components/teams_widgets/team_news_small.dart';
import 'package:hoop/components/teams_widgets/team_schedule_small.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/components/teams_widgets/playerlst.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/teams/team_info_page.dart';
import 'package:hoop/screens/views/teams/team_media_page.dart';
import 'package:hoop/screens/views/teams/team_schedule.dart';
import 'package:hoop/screens/views/teams/team_stats.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamDetails extends StatefulWidget {
  //final dynamic json;
  final String nbaTeamId;

  TeamDetails({@required this.nbaTeamId});

  @override
  _TeamDetailsState createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  bool dataLoaded = false;
  @override
  initState() {
    super.initState();
    loadData();
  }

  Future<dynamic> loadData() async {
    if (Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats() ==
        null) {
      dynamic baseTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsBase(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setBaseTeamStats(baseTeamStats);

      return baseTeamStats;
    } else {
      return Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats();
    }
  }

  String year = "2021";
  @override
  Widget build(BuildContext context) {
    final ta = ConstantHelper.getTeamDetailsBasic(widget.nbaTeamId);
    final tb = ConstantHelper.getTeamDetailsAdvanced(widget.nbaTeamId);
    final team = tb["TeamDetails"];
    final LeagueStandingList standings =
        Provider.of<JsonFiles>(context, listen: false).getLeagueStandings();
    final teamStandings = standings.getTeamStandings(widget.nbaTeamId);

    var teamColor = ConstantHelper.getTeamColor(widget.nbaTeamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(widget.nbaTeamId);
    // var teamBackgroundImage =
    //     ConstantHelper.getTeamBackgroundImage(widget.nbaTeamId);

    year = Provider.of<JsonFiles>(context, listen: false).getYear();

    var deviceWidth = MediaQuery.of(context).size.width;

    Future<void> _launched;

    return Scaffold(
        backgroundColor: Color(0XFFEDF1FF),
        appBar: AppBar(
          title: Text(
            ta[0],
            style: TextStyle(color: Color(teamTextColor)),
          ),
          backgroundColor: Color(teamColor),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CachedLogo(
                                    url: ta[2],
                                    radius: 45,
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text(
                                          ta[3].toString().toUpperCase() +
                                              'ERN CONFERENCE',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          ta[6].toString().toUpperCase() +
                                              ' DIVISION',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10),
                                      Text(
                                        "${teamStandings.wins} - ${teamStandings.losses}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Text(teamStandings.conferenceGamesBack
                                                  .toString() +
                                              " GB"),
                                          SizedBox(width: 10),
                                          Text(teamStandings.strCurrentStreak
                                              .toString()),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Tap to view team info...",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamInfoPage(
                          team: team,
                        ),
                      ));
                },
              ),
              SizedBox(height: 12),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.leaderboard,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Stats",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
              GestureDetector(
                child: Card(
                    shape: RoundedRectangleBorder(
                      // borderRadius:
                      //     BorderRadius.circular(10), // if you need this
                      side: BorderSide(
                        color: Colors.cyan,
                        width: 1,
                      ),
                    ),
                    child: FutureBuilder(
                        future: loadData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              !snapshot.hasData) {
                            return Column(children: [
                              SizedBox(height: 20),
                              Text('No data')
                            ]);
                          }
                          if (snapshot.hasData) {
                            dynamic baseStats =
                                Provider.of<JsonFiles>(context, listen: false)
                                    .getBaseTeamStats();
                            var teamStats =
                                getTeamStats(widget.nbaTeamId, baseStats);

                            return Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Column(children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    standing("${teamStats[9]}", "FG %"),
                                    standing("${teamStats[12]}", "3P %"),
                                    standing("${teamStats[15]}", "FT %"),
                                    standing("${teamStats[19]}", "Asts"),
                                    standing("${teamStats[20]}", "TOs"),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    standing("${teamStats[18]}", "Reb"),
                                    standing("${teamStats[21]}", "Stls"),
                                    standing("${teamStats[22]}", "Blks"),
                                    standing("${teamStats[24]}", "PFs"),
                                    standing("${teamStats[27]}", "+/-"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Tap to view detailed stats...",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ]),
                            );
                          }
                          return NoConnection();
                        })),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamStatsView(
                          teamId: widget.nbaTeamId,
                        ),
                      ));
                },
              ),
              SizedBox(height: 12),
              DashboardSectionBox(
                dashboardWidget: TeamNewsSmall(ta[1], widget.nbaTeamId),
                iconData: Icons.video_collection_sharp,
                linkWidget: TeamMediaPage(teamId: widget.nbaTeamId),
                sectionTitle: "Media",
                tapMoreText: "Tap to view team-related media...",
              ),
              SizedBox(height: 12),
              DashboardSectionBox(
                dashboardWidget: TeamScheduleSmall(teamId: widget.nbaTeamId),
                iconData: Icons.calendar_view_month_rounded,
                linkWidget: TeamSchedule(teamId: widget.nbaTeamId),
                sectionTitle: "Schedule",
                tapMoreText: "Tap to view full schedule...",
              ),
              SizedBox(height: 12),
              DashboardSectionBox(
                dashboardWidget: PlayerList(
                  teamId: widget.nbaTeamId,
                  teamColor: teamColor,
                ),
                iconData: Icons.list_alt_rounded,
                linkWidget: null,
                sectionTitle: "Roster",
                tapMoreText: "Tap player to view details...",
              ),
              SizedBox(height: 12),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.show_chart_sharp,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Leaders",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
              teamStatLeaders(ta[1].toLowerCase()),
            ],
          ),
        ));
  }

  Widget standing(String value, String desc) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "$desc",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Container(
              height: 1,
              width: 30,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400], width: 1))),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget teamStatLeaders(String teamName) {
    return FutureBuilder(
        future: Network.getJson(Urls.nbaTeamStatLeaders(year, teamName)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          Widget cntr;
          if (snapshot.hasData) {
            var stats = snapshot.data["league"]["standard"];
            cntr = Container(
              child: Column(
                children: [
                  //Text("Team Leaders", style: TextStyle(fontSize: 24)),
                  TeamLeaderCard(
                      playerId: stats["ppg"][0]["personId"],
                      value: stats["ppg"][0]["value"] + " PPG"),
                  TeamLeaderCard(
                      playerId: stats["trpg"][0]["personId"],
                      value: stats["trpg"][0]["value"] + " RPG"),
                  TeamLeaderCard(
                      playerId: stats["apg"][0]["personId"],
                      value: stats["apg"][0]["value"] + " APG"),
                  TeamLeaderCard(
                      playerId: stats["fgp"][0]["personId"],
                      value: (double.parse(stats["fgp"][0]["value"]) * 100)
                              .toStringAsFixed(1) +
                          " FG%"),
                  TeamLeaderCard(
                      playerId: stats["bpg"][0]["personId"],
                      value: stats["bpg"][0]["value"] + " BPG"),
                  TeamLeaderCard(
                      playerId: stats["spg"][0]["personId"],
                      value: stats["spg"][0]["value"] + " SPG"),
                  TeamLeaderCard(
                      playerId: stats["tpg"][0]["personId"],
                      value: stats["tpg"][0]["value"] + " TPG"),
                  TeamLeaderCard(
                      playerId: stats["pfpg"][0]["personId"],
                      value: stats["pfpg"][0]["value"] + " PFPG"),
                ],
              ),
            );
          } else {
            cntr = Text(' ');
          }

          return cntr;
        });
  }

  dynamic getTeamStandingsFromJson(
      String teamId, dynamic json, String conference) {
    dynamic team;

    if (conference.toLowerCase() == "east") {
      for (var t in json["east"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
        }
      }
    } else {
      for (var t in json["west"]) {
        if (t["teamId"] == teamId) {
          team = t;
          break;
        }
      }
    }

    return team;
  }

  dynamic getTeamStats(String teamId, dynamic stats) {
    dynamic team;
    for (var t in stats["resultSets"][0]["rowSet"]) {
      if (t[0].toString() == teamId) {
        team = t;
      }
    }

    return team;
  }
}
