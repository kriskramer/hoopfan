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
              showPoints(true),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Rebounds'),
              showRebounds(true),
              SizedBox(
                height: 30,
              ),
              getSectionHeader('Assists'),
              showAssists(true),
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

  Widget showPoints(bool leaders) {
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

  Widget showRebounds(bool leaders) {
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

  Widget showAssists(bool leaders) {
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
