import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/model/advanced_stats.dart';
import 'package:hoop/models/standing.dart';
import 'package:hoop/models/team_stats/team_stats.dart';
import 'package:hoop/screens/views/standings_view/standings.dart';
import 'package:provider/provider.dart';

class StatsMain extends StatefulWidget {
  @override
  _StatsMainState createState() => _StatsMainState();
}

class _StatsMainState extends State<StatsMain> {
  List<Standing> listStandings = new List<Standing>();
  List<TeamStats> listTeamStats = new List<TeamStats>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF1F6BA3),
            automaticallyImplyLeading: false, // hides back arrow button
            toolbarHeight: 50,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Teams",
                ),
                Tab(
                  text: "Players",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.amber[300],
                      child: Center(
                          child: Text(
                        'Streaks',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
                  Row(
                    children: [
                      Column(
                        children: [
                          showWinStreak(),
                        ],
                      ),
                      Column(
                        children: [
                          showLosingStreak(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.amber[300],
                      child: Center(
                          child: Text(
                        'Wins and Losses',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
                  Row(
                    children: [
                      Column(
                        children: [
                          showMostWins(),
                        ],
                      ),
                      Column(
                        children: [
                          showMostLosses(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.amber[300],
                      child: Center(
                          child: Text(
                        'Points per Game',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
                  Row(
                    children: [
                      Column(
                        children: [
                          showMostPoints(),
                        ],
                      ),
                      Column(
                        children: [
                          showLeastPoints(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.amber[300],
                      child: Center(
                          child: Text(
                        'Opponent Points per Game',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
                  Row(
                    children: [
                      Column(
                        children: [
                          showLeastOPPG(),
                        ],
                      ),
                      Column(
                        children: [
                          showMostOPPG(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
              SingleChildScrollView(
                child: Text('PLayers'),
              )
            ],
          )),
    );
  }

  Widget showWinStreak() {
    sortStandingsByWinStreak();
    List<DataRow> list = new List<DataRow>();

    for (var s in listStandings) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.teamSitesOnly.teamNickname),
        ),
        DataCell(Text(s.streak.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [DataColumn(label: Text('Team')), DataColumn(label: Text('W'))],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLosingStreak() {
    sortStandingsByLosingStreak();
    List<DataRow> list = new List<DataRow>();

    for (var s in listStandings) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.teamSitesOnly.teamNickname),
        ),
        DataCell(Text(s.streak.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [DataColumn(label: Text('Team')), DataColumn(label: Text('L'))],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostWins() {
    sortStandingsByWins();
    List<DataRow> list = new List<DataRow>();

    for (var s in listStandings) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.teamSitesOnly.teamNickname),
        ),
        DataCell(Text(s.win))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [DataColumn(label: Text('Team')), DataColumn(label: Text('W'))],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostLosses() {
    sortStandingsByLosses();
    List<DataRow> list = new List<DataRow>();

    for (var s in listStandings) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.teamSitesOnly.teamNickname),
        ),
        DataCell(Text(s.loss))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [DataColumn(label: Text('Team')), DataColumn(label: Text('L'))],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostPoints() {
    sortTeamStatsByMostTotalPoints();
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.ppg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('PPG'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLeastPoints() {
    sortTeamStatsByLeastTotalPoints();
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.ppg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('PPG'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostOPPG() {
    sortTeamStatsByMostOPPG();
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.oppg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('OPPG'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLeastOPPG() {
    sortTeamStatsByLeastOPPG();
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.oppg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      //horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('OPPG'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  void loadData() {
    dynamic standings;
    dynamic teamStats;

    standings =
        Provider.of<JsonFiles>(context, listen: false).getConfStandings();

    for (var s in standings["league"]["standard"]["conference"]["east"]) {
      listStandings.add(Standing.fromJson(s));
    }
    for (var s in standings["league"]["standard"]["conference"]["west"]) {
      listStandings.add(Standing.fromJson(s));
    }

    teamStats =
        Provider.of<JsonFiles>(context, listen: false).getAllTeamStats();

    for (var t in teamStats["league"]["standard"]["regularSeason"]["teams"]) {
      listTeamStats.add(TeamStats.fromJson(t));
    }
  }

  void sortStandingsByWinStreak() {
    // Sort by win streak
    listStandings.sort((a, b) {
      if (a.sortKey.streak > b.sortKey.streak)
        return 1;
      else
        return -1;
    });
  }

  void sortStandingsByLosingStreak() {
    // Sort by losing streak
    listStandings.sort((a, b) {
      if (a.sortKey.streak < b.sortKey.streak)
        return 1;
      else
        return -1;
    });
  }

  void sortStandingsByWins() {
    // Sort by total wins
    listStandings.sort((a, b) {
      if (int.parse(a.win) < int.parse(b.win))
        return 1;
      else
        return -1;
    });
  }

  void sortStandingsByLosses() {
    // Sort by total wins
    listStandings.sort((a, b) {
      if (int.parse(a.loss) < int.parse(b.loss))
        return 1;
      else
        return -1;
    });
  }

  void sortTeamStatsByMostTotalPoints() {
    // Sort by total points
    listTeamStats.sort((a, b) {
      if (double.parse(a.ppg.avg) < double.parse(b.ppg.avg))
        return 1;
      else
        return -1;
    });
  }

  void sortTeamStatsByLeastTotalPoints() {
    // Sort by total points
    listTeamStats.sort((a, b) {
      if (double.parse(a.ppg.avg) > double.parse(b.ppg.avg))
        return 1;
      else
        return -1;
    });
  }

  void sortTeamStatsByMostOPPG() {
    // Sort by total points
    listTeamStats.sort((a, b) {
      if (double.parse(a.oppg.avg) < double.parse(b.oppg.avg))
        return 1;
      else
        return -1;
    });
  }

  void sortTeamStatsByLeastOPPG() {
    // Sort by total points
    listTeamStats.sort((a, b) {
      if (double.parse(a.oppg.avg) > double.parse(b.oppg.avg))
        return 1;
      else
        return -1;
    });
  }
}
