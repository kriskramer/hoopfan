import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class StandingsTable extends StatefulWidget {
  final List<LeagueStanding> list;
  final int teamCount;
//  final dynamic json;
  StandingsTable({this.list, this.teamCount});
  @override
  _StandingsTableState createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {
  List<DataRow> tableData() {
    List<DataRow> table = List.filled(widget.teamCount, null);
    for (int index = 0; index < widget.teamCount; index++) {
      LeagueStanding team = widget.list[index];
      table[index] = DataRow(
        cells: [
          DataCell(
            CachedLogo(
                radius: 12,
                url: ConstantHelper.getTeamLogo(team.teamID.toString())),
          ),
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
              "${team.divisionGamesBack}",
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
      dataRowHeight: 36,
      headingRowHeight: 30,
      columns: [
        DataColumn(
          label: Text(
            '',
          ),
        ),
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
              color: Colors.blueGrey,
            ),
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'GB',
            style: TextStyle(
              color: Colors.blueGrey,
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
