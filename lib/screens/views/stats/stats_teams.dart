import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/standing.dart';
import 'package:hoop/models/team_stats/team_stats.dart';
import 'package:provider/provider.dart';

class StatsTeams extends StatefulWidget {
  @override
  _StatsTeamsState createState() => _StatsTeamsState();
}

class _StatsTeamsState extends State<StatsTeams> {
  List<Standing> listStandings = new List<Standing>();
  //List<TeamStats> listTeamStats = new List<TeamStats>();
  TeamStatsList listTeamStats = new TeamStatsList();
  bool sort = true;
  int colIndex = 1;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
            width: double.infinity,
            child: Center(
                child: Text(
              'LEADERS / LOSERS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))),
        SizedBox(
          height: 15,
        ),
        getSectionHeader('Streaks'),
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
        getSectionHeader('Wins and Losses'),
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
        getSectionHeader('Points per Game'),
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
        getSectionHeader('Opponent Points per Game'),
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
        getSectionHeader('FG %'),
        Row(
          children: [
            Column(
              children: [
                showMostFgp(),
              ],
            ),
            Column(
              children: [
                showLeastFgp(),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        getSectionHeader('FT %'),
        Row(
          children: [
            Column(
              children: [
                showMostFtp(),
              ],
            ),
            Column(
              children: [
                showLeastFtp(),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        getSectionHeader('3P %'),
        Row(
          children: [
            Column(
              children: [
                showMostTpp(),
              ],
            ),
            Column(
              children: [
                showLeastTpp(),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        getSectionHeader('Total Rebs'),
        Row(
          children: [
            Column(
              children: [
                showMostReb(),
              ],
            ),
            Column(
              children: [
                showLeastReb(),
              ],
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
            width: double.infinity,
            child: Center(
                child: Text(
              'ALL TEAM STATS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))),
        Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: getAllTeamStatsDataTable(),
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    ));
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
    listTeamStats.sortByPPG(false);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
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
    listTeamStats.sortByPPG(true);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
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
    listTeamStats.sortByOPPG(false);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.oppg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 5,
      horizontalMargin: 0,
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
    listTeamStats.sortByOPPG(true);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
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

  Widget showMostFgp() {
    listTeamStats.sortByFgp(false);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text((double.parse(t.fgp.avg) * 100).toStringAsFixed(1) + "%"))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      //horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('FGP'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLeastFgp() {
    listTeamStats.sortByFgp(true);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text((double.parse(t.fgp.avg) * 100).toStringAsFixed(1) + "%"))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('FGP'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostFtp() {
    listTeamStats.sortByFtp(false);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text((double.parse(t.ftp.avg) * 100).toStringAsFixed(1) + "%"))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      //horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('FTP'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLeastFtp() {
    listTeamStats.sortByFtp(true);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text((double.parse(t.ftp.avg) * 100).toStringAsFixed(1) + "%"))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('FTP'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostTpp() {
    listTeamStats.sortByTpp(false);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text((double.parse(t.tpp.avg) * 100).toStringAsFixed(1) + "%"))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      //horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [DataColumn(label: Text('Team')), DataColumn(label: Text('3P'))],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLeastTpp() {
    listTeamStats.sortByTpp(true);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text((double.parse(t.tpp.avg) * 100).toStringAsFixed(1) + "%"))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [DataColumn(label: Text('Team')), DataColumn(label: Text('3P'))],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showMostReb() {
    listTeamStats.sortByTReb(false);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.trpg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      //horizontalMargin: 1,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('TReb'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget showLeastReb() {
    listTeamStats.sortByTReb(true);
    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.trpg.avg))
      ]));
    }

    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 5,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('TReb'))
      ],
      rows: [
        ...list.getRange(0, 5),
      ],
    );
  }

  Widget getAllTeamStatsDataTable() {
    if (colIndex == 0) {
      if (sort) {
        listTeamStats.sortByName(false);
      } else {
        listTeamStats.sortByName(true);
      }
    }
    if (colIndex == 1) {
      if (sort) {
        listTeamStats.sortByPPG(false);
      } else {
        listTeamStats.sortByPPG(true);
      }
    }
    if (colIndex == 2) {
      if (sort) {
        listTeamStats.sortByOPPG(false);
      } else {
        listTeamStats.sortByOPPG(true);
      }
    }
    if (colIndex == 3) {
      if (sort) {
        listTeamStats.sortByEff(false);
      } else {
        listTeamStats.sortByEff(true);
      }
    }
    if (colIndex == 4) {
      if (sort) {
        listTeamStats.sortByFgp(false);
      } else {
        listTeamStats.sortByFgp(true);
      }
    }
    if (colIndex == 5) {
      if (sort) {
        listTeamStats.sortByFtp(false);
      } else {
        listTeamStats.sortByFtp(true);
      }
    }
    if (colIndex == 6) {
      if (sort) {
        listTeamStats.sortByTpp(false);
      } else {
        listTeamStats.sortByTpp(true);
      }
    }
    if (colIndex == 7) {
      if (sort) {
        listTeamStats.sortByOReb(false);
      } else {
        listTeamStats.sortByOReb(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        listTeamStats.sortByDReb(false);
      } else {
        listTeamStats.sortByDReb(true);
      }
    }
    if (colIndex == 9) {
      if (sort) {
        listTeamStats.sortByTReb(false);
      } else {
        listTeamStats.sortByTReb(true);
      }
    }
    if (colIndex == 10) {
      if (sort) {
        listTeamStats.sortByAsts(false);
      } else {
        listTeamStats.sortByAsts(true);
      }
    }
    if (colIndex == 11) {
      if (sort) {
        listTeamStats.sortByStls(false);
      } else {
        listTeamStats.sortByStls(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        listTeamStats.sortByBlks(false);
      } else {
        listTeamStats.sortByBlks(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        listTeamStats.sortByTOs(false);
      } else {
        listTeamStats.sortByTOs(true);
      }
    }
    if (colIndex == 14) {
      if (sort) {
        listTeamStats.sortByPFs(false);
      } else {
        listTeamStats.sortByPFs(true);
      }
    }

    List<DataRow> list = new List<DataRow>();

    for (var t in listTeamStats.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(t.nickname),
        ),
        DataCell(Text(t.ppg.avg)),
        DataCell(Text(t.oppg.avg)),
        DataCell(Text(t.eff.avg)),
        DataCell(Text(t.fgp.avg)),
        DataCell(Text(t.ftp.avg)),
        DataCell(Text(t.tpp.avg)),
        DataCell(Text(t.orpg.avg)),
        DataCell(Text(t.drpg.avg)),
        DataCell(Text(t.trpg.avg)),
        DataCell(Text(t.apg.avg)),
        DataCell(Text(t.spg.avg)),
        DataCell(Text(t.bpg.avg)),
        DataCell(Text(t.tpg.avg)),
        DataCell(Text(t.pfpg.avg)),
      ]));
    }

    return DataTable(
      sortAscending: sort,
      sortColumnIndex: colIndex,
      columnSpacing: 8,
      horizontalMargin: 5,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(
            label: Text('Team'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('PPG'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('OPPG'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('Eff'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('FG%'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('FT%'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('3P%'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('OReb'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('DReb'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('TReb'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('Asts'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('Stls'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('Blks'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('TOs'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
        DataColumn(
            label: Text('PFs'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
                colIndex = columnIndex;
              });
            }),
      ],
      rows: [
        ...list,
      ],
    );
  }

  Widget getSectionHeader(String headerText) {
    return Container(
        width: double.infinity,
        height: 20,
        color: Colors.amber[100],
        child: Center(
            child: Text(
          headerText,
          style: TextStyle(fontWeight: FontWeight.bold),
        )));
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
      listTeamStats.items.add(TeamStats.fromJson(t));
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
}
