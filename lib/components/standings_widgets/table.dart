import 'package:flutter/material.dart';
import 'package:hoop/screens/views/teams_view/teaminfo.dart';

class ConfTable extends StatefulWidget {
  final dynamic json;
  ConfTable({this.json});
  @override
  _ConfTableState createState() => _ConfTableState();
}

class _ConfTableState extends State<ConfTable> {
  List<DataRow> tableData() {
    List<DataRow> table = List(15);

    for (int index = 0; index < widget.json.length; index++) {
      dynamic team = widget.json[index];
      table[index] = DataRow(
        cells: [
          DataCell(
              Text(
                "${index + 1} ${team["teamSitesOnly"]["teamNickname"]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ), onTap: () {
            var teamId = widget.json[index]["teamId"];
            print(teamId);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamDetails(
                  //json: widget.json[index], //teamJson,
                  nbaTeamId: teamId,
                ),
              ),
            );
          }),
          DataCell(
            Text(
              "${team["win"]}".trim(),
              style: TextStyle(fontSize: 14),
            ), //
          ),
          DataCell(
            Text(
              "${team["loss"]}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              "${team["winPct"]}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              "${team["gamesBehind"]}",
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              "${team["lastTenWin"]}-${team["lastTenLoss"]}",
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
