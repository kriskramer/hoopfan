import 'package:hoop/components/cacheimg.dart';
import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/components/teams_widgets/playerlst.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/teams_view/team_info_page.dart';
import 'package:hoop/screens/views/teams_view/team_media_page.dart';
import 'package:hoop/screens/views/teams_view/team_news_page.dart';
import 'package:hoop/screens/views/teams_view/team_schedule.dart';
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
  String year = "2020";
  @override
  Widget build(BuildContext context) {
    final ta = ConstantHelper.getTeamDetailsBasic(widget.nbaTeamId);
    final tb = ConstantHelper.getTeamDetailsAdvanced(widget.nbaTeamId);
    final team = tb["TeamDetails"];
    //final standings = widget.json;
    final standingsJson = Provider.of<JsonFiles>(context, listen: false)
        .getStandings()["league"]["standard"]["conference"];

    var standings =
        getTeamStandingsFromJson(widget.nbaTeamId, standingsJson, ta[3]);

    final social = team[2]["SocialSites"];

    final teamStats = Provider.of<JsonFiles>(context, listen: false)
        .getTeamStats(widget.nbaTeamId);

    var teamColor = ConstantHelper.getTeamColor(widget.nbaTeamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(widget.nbaTeamId);

    year = Provider.of<JsonFiles>(context, listen: false).getYear();

    var deviceWidth = MediaQuery.of(context).size.width;

    //var a = Network.getJsonWithBingHeader(Urls.getBingVideoSearch("dallas mavericks"));

    Future<void> _launched;
    // final String streak = standings != null
    //     ? standings["isWinStreak"]
    //         ? "W"
    //         : "L"
    //     : ""; // has the team been on a winning or losing streak
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
                        child: Padding(
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
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.link,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        children: [
                                          Text(ta[3].toString().toUpperCase() +
                                              'ERN CONFERENCE'),
                                          Text(ta[6].toString().toUpperCase() +
                                              ' DIVISION'),
                                          SizedBox(height: 10),
                                          Text(
                                            "${standings["win"]} - ${standings["loss"]}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: deviceWidth - 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FlatButton(
                                          child: Text('Media',
                                              style: TextStyle(
                                                  color: Color(teamTextColor))),
                                          color: Color(teamColor),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeamMediaPage(
                                                          teamId: widget
                                                              .nbaTeamId)),
                                            );
                                          },
                                        ),
                                        RaisedButton(
                                          child: Text('Stats',
                                              style: TextStyle(
                                                  color: Color(teamTextColor))),
                                          color: Color(teamColor),
                                          onPressed: () {},
                                        ),
                                        RaisedButton(
                                          child: Text('Info',
                                              style: TextStyle(
                                                  color: Color(teamTextColor))),
                                          color: Color(teamColor),
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: deviceWidth - 80,
                          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.grey[300], width: 1),
                          ),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                standing(standings["win"], "Win"),
                                standing(standings["loss"], "Loss"),
                                standing(standings["winPct"], "%"),
                                standing(standings["gamesBehind"], "GB"),
                                standing(standings["streak"], "Streak"),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                standing(
                                    "${standings["lastTenWin"]}-${standings["lastTenLoss"]}",
                                    "Last 10"),
                                standing(
                                    "${standings["confWin"]}-${standings["confLoss"]}",
                                    "Conf"),
                                standing(
                                    "${standings["divWin"]}-${standings["divLoss"]}",
                                    "Div"),
                                standing(
                                    "${standings["homeWin"]}-${standings["homeLoss"]}",
                                    "Home"),
                                standing(
                                    "${standings["awayWin"]}-${standings["awayLoss"]}",
                                    "Away"),
                              ],
                            ),
                          ])),
                      SizedBox(height: 10),
                      Container(
                        width: deviceWidth - 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[300], width: 1),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["ppg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["ppg"]["rank"],
                                      "PPG"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["oppg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["oppg"]["rank"],
                                      "OPPG"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["eff"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["eff"]["rank"],
                                      "EFF"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["fgp"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["fgp"]["rank"],
                                      "FG%"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["tpp"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["tpp"]["rank"],
                                      "3P%"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["ftp"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["ftp"]["rank"],
                                      "FT%"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["orpg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["orpg"]["rank"],
                                      "ORPG"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["drpg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["drpg"]["rank"],
                                      "DRPG"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["trpg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["trpg"]["rank"],
                                      "TRPG"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["apg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["apg"]["rank"],
                                      "APG"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["spg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["spg"]["rank"],
                                      "SPG"),
                                  stat(
                                      teamStats == null
                                          ? "0"
                                          : teamStats["bpg"]["avg"],
                                      teamStats == null
                                          ? "0"
                                          : teamStats["bpg"]["rank"],
                                      "BPG"),
                                ],
                              ),
                              SizedBox(height: 10),
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: deviceWidth - 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            //...socialList(social),
                          ],
                        ),
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
      String link = r["WebSite_Link"];
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

  Widget stat(String value, String rank, String desc) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "$desc ($rank)",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
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
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["ppg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["ppg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["ppg"][0]["value"] + " PPG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["trpg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["trpg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["trpg"][0]["value"] + " RPG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["apg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["apg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["apg"][0]["value"] + " APG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["fgp"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["fgp"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["fgp"][0]["value"] + " %",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["bpg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["bpg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["bpg"][0]["value"] + " BPG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["spg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["spg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["spg"][0]["value"] + " SPG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["tpg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["tpg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["tpg"][0]["value"] + " TPG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CachedLogo(
                              url:
                                  "https://cdn.nba.com/headshots/nba/latest/1040x760/${stats["pfpg"][0]["personId"]}.png",
                              radius: 35,
                            ),
                            Text(
                              getPlayerName(stats["pfpg"][0]["personId"]),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Text(
                          stats["pfpg"][0]["value"] + " PFPG",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            cntr = Text(' ');
          }

          return cntr;
        });
  }

  String getPlayerName(String playerId) {
    var player =
        Provider.of<JsonFiles>(context, listen: false).getPlayer(playerId);

    if (player != null) {
      return player["firstName"] + " " + player["lastName"];
    } else {
      return "Unknown Player";
    }
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
}
