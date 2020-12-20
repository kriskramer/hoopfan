import 'package:flutter/material.dart';
import 'package:hoop/screens/views/teams_view/teaminfo.dart';

class DivTable extends StatefulWidget {
  final dynamic json;
  DivTable({this.json});
  @override
  _DivTableState createState() => _DivTableState();
}

class _DivTableState extends State<DivTable> {
  List<DataRow> tableData() {
    List<DataRow> table = List(5);
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
              "${team["streak"]}",
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
              color: Colors.amber,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Str',
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
      ],
      rows: tableData(),
    );
  }
}
