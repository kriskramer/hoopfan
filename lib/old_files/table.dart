import 'package:flutter/material.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class ConfTable extends StatefulWidget {
  //final dynamic json;
  final List<LeagueStanding> list;
  ConfTable({this.list});
  @override
  _ConfTableState createState() => _ConfTableState();
}

class _ConfTableState extends State<ConfTable> {
  List<DataRow> tableData() {
    List<DataRow> table = List(15);

    for (int index = 0; index < widget.list.length; index++) {
      LeagueStanding team = widget.list[index];
      table[index] = DataRow(
        cells: [
          DataCell(
              Text(
                "${index + 1} ${team.teamName}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ), onTap: () {
            var teamId = team.teamID;
            print(teamId);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamDetails(
                  //json: widget.json[index], //teamJson,
                  nbaTeamId: teamId.toString(),
                ),
              ),
            );
          }),
          DataCell(
            Text(
              "${team.wins}".trim(),
              style: TextStyle(fontSize: 14),
            ), //
          ),
          DataCell(
            Text(
              "${team.losses}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              "${team.winPct}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              "${team.conferenceGamesBack}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              "${team.l10}",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      );
    }
    return table;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 8,
      columns: [
        DataColumn(
          label: Text(
            'Team',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'W',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'L',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'Pct',
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'GB',
            style: TextStyle(
              color: Colors.deepPurple,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'L10',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
      rows: tableData(),
    );
  }
}
