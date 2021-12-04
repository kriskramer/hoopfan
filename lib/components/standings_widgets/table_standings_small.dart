import 'package:flutter/material.dart';
import 'package:hoop/components/cacheimg.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/league_standings.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class StandingsTableSmall extends StatefulWidget {
  final List<LeagueStanding> list;
  final int teamCount;
  StandingsTableSmall({this.list, this.teamCount});
  @override
  _StandingsTableSmallState createState() => _StandingsTableSmallState();
}

class _StandingsTableSmallState extends State<StandingsTableSmall> {
  List<DataRow> tableData() {
    List<DataRow> table = List.filled(widget.teamCount, null);
    for (int index = 0; index < widget.teamCount; index++) {
      LeagueStanding team = widget.list[index];
      table[index] = DataRow(
        cells: [
          // DataCell(
          //   CachedLogo(
          //       radius: 10,
          //       url: ConstantHelper.getTeamLogo(team.teamID.toString())),
          // ),
          DataCell(
              Text(
                "${index + 1} ${team.teamName}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              style: TextStyle(fontSize: 12),
            ), //
          ),
          DataCell(
            Text(
              "${team.losses}",
              style: TextStyle(fontSize: 12),
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
      columnSpacing: 5,
      headingRowHeight: 0,
      dataRowHeight: 20,
      columns: [
        // DataColumn(
        //   label: Text(
        //     '',
        //   ),
        // ),
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
      ],
      rows: tableData(),
    );
  }
}
