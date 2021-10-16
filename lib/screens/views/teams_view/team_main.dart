//import 'dart:math';

import 'package:hoop/components/cacheimg.dart';
import 'package:flutter/material.dart';
import 'package:hoop/components/teams_widgets/team_leader_card.dart';
import 'package:hoop/components/teams_widgets/team_schedule_small.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/components/teams_widgets/playerlst.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/teams_view/team_info_page.dart';
import 'package:hoop/screens/views/teams_view/team_media_page.dart';
import 'package:hoop/screens/views/teams_view/team_schedule.dart';
import 'package:hoop/screens/views/teams_view/team_stats.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/components/connection.dart';
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

  String year = "2021";
  @override
  Widget build(BuildContext context) {
    final ta = ConstantHelper.getTeamDetailsBasic(widget.nbaTeamId);
    final tb = ConstantHelper.getTeamDetailsAdvanced(widget.nbaTeamId);
    final team = tb["TeamDetails"];
    final LeagueStandingList standings =
        Provider.of<JsonFiles>(context, listen: false).getLeagueStandings();
    final teamStandings = standings.getTeamStandings(widget.nbaTeamId);

    // final teamStats = Provider.of<JsonFiles>(context, listen: false)
    //     .getTeamStats(widget.nbaTeamId);

    var teamColor = ConstantHelper.getTeamColor(widget.nbaTeamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(widget.nbaTeamId);
    // var teamBackgroundImage =
    //     ConstantHelper.getTeamBackgroundImage(widget.nbaTeamId);

    year = Provider.of<JsonFiles>(context, listen: false).getYear();

    var deviceWidth = MediaQuery.of(context).size.width;

    Future<void> _launched;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0XFFEDF1FF),
        appBar: AppBar(
          title: Text(
            ta[0],
            style: TextStyle(color: Color(teamTextColor)),
          ),
          backgroundColor: Color(teamColor),
          bottom: TabBar(
            tabs: [
              Tab(
                child:
                    Text("Team", style: TextStyle(color: Color(teamTextColor))),
              ),
              Tab(
                child: Text("Roster",
                    style: TextStyle(color: Color(teamTextColor))),
              ),
              Tab(
                child: Text("Schedule",
                    style: TextStyle(color: Color(teamTextColor))),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            standings == null
                ? NoConnection()
                : ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          // TODO: Some background images don't look good, or don't load.
                          // Need to spend some more time on this...
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         colorFilter: new ColorFilter.mode(
                          //             Colors.black.withOpacity(0.50),
                          //             BlendMode.dstATop),
                          //         image: NetworkImage(teamBackgroundImage),
                          //         fit: BoxFit.cover)),
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          CachedLogo(
                                            url: ta[2],
                                            radius: 45,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              String name = ta[1] == "76ers"
                                                  ? "sixers"
                                                  : ta[1].toLowerCase();
                                              setState(
                                                () {
                                                  _launched =
                                                      Network.launchSite(
                                                    Urls.link(
                                                      name,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  ta[1],
                                                  style: TextStyle(
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.link,
                                                  color: Colors.grey[800],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        child: Text('Media',
                                            style: TextStyle(
                                                color: Color(teamTextColor))),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Color(teamColor))),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TeamMediaPage(
                                                        teamId:
                                                            widget.nbaTeamId)),
                                          );
                                        },
                                      ),
                                      dataLoaded
                                          ? SizedBox(
                                              width: 10,
                                            )
                                          : SizedBox(
                                              width: 1,
                                            ),
                                      dataLoaded
                                          ? TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Color(teamColor))),
                                              child: Text('Stats',
                                                  style: TextStyle(
                                                      color: Color(
                                                          teamTextColor))),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeamStatsView(
                                                        teamId:
                                                            widget.nbaTeamId,
                                                      ),
                                                    ));
                                              },
                                            )
                                          : SizedBox(
                                              width: 1,
                                            ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                        child: Text('Info',
                                            style: TextStyle(
                                                color: Color(teamTextColor))),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Color(teamColor))),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TeamInfoPage(
                                                  team: team,
                                                ),
                                              ));
                                        },
                                      ),
                                      //...socialList(social, teamColor),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              standing(teamStandings.wins.toString(), "Win"),
                              standing(teamStandings.losses.toString(), "Loss"),
                              standing(
                                  teamStandings.winPct.toString(), "Win %"),
                              standing(
                                  teamStandings.conferenceGamesBack.toString(),
                                  "GB"),
                              standing(
                                  teamStandings.strCurrentStreak.toString(),
                                  "Streak"),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              standing("${teamStandings.l10}", "Last 10"),
                              standing(
                                  "${teamStandings.conferenceRecord}", "Conf"),
                              standing(
                                  "${teamStandings.divisionRecord}", "Div"),
                              standing("${teamStandings.home}", "Home"),
                              standing("${teamStandings.road}", "Away"),
                            ],
                          ),
                        ]),
                      )),
                      SizedBox(height: 20),
                      Center(
                          child: Text("Last Game",
                              style: TextStyle(fontSize: 24))),
                      TeamScheduleSmall(teamId: widget.nbaTeamId),
                      SizedBox(
                        height: 20,
                      ),
                      teamStatLeaders(ta[1].toLowerCase()),
                      FutureBuilder<void>(
                        // launch the teams official website
                        future: _launched,
                        builder: (BuildContext context,
                            AsyncSnapshot<void> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const Text('');
                          }
                        },
                      ),
                    ],
                  ),
            SingleChildScrollView(
              child: PlayerList(
                teamId: widget.nbaTeamId,
                teamColor: teamColor,
              ),
            ),
            SingleChildScrollView(
              child: TeamSchedule(teamId: widget.nbaTeamId),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> socialList(dynamic json, int teamColor) {
    List<Widget> buttons = new List<Widget>();

    for (var r in json) {
      String account = r["AccountType"];
      //String link = r["WebSite_Link"];
      buttons.add(RaisedButton(
        color: Color(teamColor),
        onPressed: () {
          // add link here
        },
        child: Text(
          account,
          style: TextStyle(color: Colors.white),
        ),
      ));
    }

    return buttons;
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
            style: TextStyle(fontSize: 18, color: Colors.grey),
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
                  Text("Team Leaders", style: TextStyle(fontSize: 24)),
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

  void loadData() async {
    if (Provider.of<JsonFiles>(context, listen: false)
            .getEstimatedTeamStats() ==
        null) {
      dynamic estimatedTeamStats = await Network.getJson(
        Urls.getNbaStatsEstimatedMetricsAllTeams(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setEstimatedTeamStats(estimatedTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false).getAdvancedTeamStats() ==
        null) {
      dynamic advancedTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsAdvanced(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setAdvancedTeamStats(advancedTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false).getBaseTeamStats() ==
        null) {
      dynamic baseTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsBase(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setBaseTeamStats(baseTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false).getMiscTeamStats() ==
        null) {
      dynamic miscTeamStats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsMisc(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setMiscTeamStats(miscTeamStats);
    }

    if (Provider.of<JsonFiles>(context, listen: false)
            .getFourFactorsTeamStats() ==
        null) {
      dynamic stats = await Network.getJson(
        Urls.getNbaStatsTeamStatisticsFourFactors(),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setFourFactorsTeamStats(stats);
    }

    if (Provider.of<JsonFiles>(context, listen: false)
            .getTeamStatsShooting(widget.nbaTeamId) ==
        null) {
      dynamic stats = await Network.getJson(
        Urls.getNbaStatsTeamShotTypes(widget.nbaTeamId),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setTeamStatsShooting(widget.nbaTeamId, stats);
    }

    setState(() {
      dataLoaded = true;
    });
  }
}
