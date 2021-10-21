import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/league_leaders.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class StatsPlayers extends StatefulWidget {
  const StatsPlayers();

  @override
  _StatsPlayersState createState() => _StatsPlayersState();
}

class _StatsPlayersState extends State<StatsPlayers> {
  bool sort = true;
  int colIndex = 0;
  LeagueLeaderList leadersList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              getSectionHeader('Points'),
              showPoints(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Rebounds'),
              showRebounds(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Assists'),
              showAssists(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Field Goal %'),
              showFGPct(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('3-Point %'),
              showFG3Pct(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Free Throw %'),
              showFTPct(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Blocks'),
              showBlocks(),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Steals'),
              showSteals(),
              SizedBox(
                height: 30,
              ),
            ]);
          } else {
            return NoConnection();
          }
        });
  }

  Future<LeagueLeaderList> loadData() async {
    dynamic leaders;

    if (Provider.of<JsonFiles>(context, listen: false).getLeagueLeaders() ==
        null) {
      leaders = await Network.getJson(Urls.getNbaStatsLeagueLeaders());
      Provider.of<JsonFiles>(context, listen: false).setLeagueLeaders(leaders);
    } else {
      leaders =
          Provider.of<JsonFiles>(context, listen: false).getLeagueLeaders();
    }

    leadersList = LeagueLeaderList(leaders);
    return leadersList;
  }

  Widget showPoints() {
    List<DataRow> list = [];

    sortByPointsDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.pts.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('Pts'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByPointsDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.pts < b.pts)
        return 1;
      else
        return -1;
    });
  }

  Widget showRebounds() {
    List<DataRow> list = [];

    sortByRebsDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.reb.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('Rebs'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByRebsDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.reb < b.reb)
        return 1;
      else
        return -1;
    });
  }

  Widget showAssists() {
    List<DataRow> list = [];

    sortByAstsDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.ast.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('Asts'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByAstsDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.ast < b.ast)
        return 1;
      else
        return -1;
    });
  }

  Widget showFGPct() {
    List<DataRow> list = [];

    sortByFGPDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.fgpct.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('FG %'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByFGPDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.fgpct < b.fgpct)
        return 1;
      else
        return -1;
    });
  }

  Widget showFG3Pct() {
    List<DataRow> list = [];

    sortByFG3PDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.fg3pct.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('3P %'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByFG3PDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.fg3pct < b.fg3pct)
        return 1;
      else
        return -1;
    });
  }

  Widget showFTPct() {
    List<DataRow> list = [];

    sortByFTPDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.ftpct.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('FT %'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByFTPDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.ftpct < b.ftpct)
        return 1;
      else
        return -1;
    });
  }

  Widget showBlocks() {
    List<DataRow> list = [];

    sortByBlkDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.blk.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('Blks'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByBlkDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.blk < b.blk)
        return 1;
      else
        return -1;
    });
  }

  Widget showSteals() {
    List<DataRow> list = [];

    sortByStlDesc();

    for (var s in leadersList.items) {
      list.add(DataRow(cells: [
        DataCell(
          Text(s.team),
        ),
        DataCell(
          Text(s.player),
        ),
        DataCell(Text(s.stl.toString()))
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      dataRowHeight: 25,
      headingRowHeight: 25,
      columns: [
        DataColumn(label: Text('Team')),
        DataColumn(label: Text('Player')),
        DataColumn(label: Text('Stls'))
      ],
      rows: [
        ...list.getRange(0, 10),
        DataRow(cells: [
          DataCell(Text('...')),
          DataCell(Text('...')),
          DataCell(Text('...')),
        ]),
        ...list.getRange(list.length - 5, list.length)
      ],
    );
  }

  void sortByStlDesc() {
    // Sort by most points
    leadersList.items.sort((a, b) {
      if (a.stl < b.stl)
        return 1;
      else
        return -1;
    });
  }

  Widget getSectionHeader(String title) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          //color: Colors.blue[100],
          border: Border(
        bottom: BorderSide(color: Colors.blue),
        //top: BorderSide(color: Colors.grey)
      )),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
