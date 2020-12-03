import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/teams_view/teaminfo.dart';

class DivTable extends StatefulWidget {
  final dynamic json;
  final Map teamIds;
  DivTable({this.json, this.teamIds});
  @override
  _DivTableState createState() => _DivTableState();
}

class _DivTableState extends State<DivTable> {
  List<DataRow> tableData() {
    List<DataRow> table = List(5);
    for (int index = 0; index < widget.teamIds.length; index++) {
      String rank = widget.json[index]["division"]["rank"];
      int pos = int.parse(rank) - 1; // position to insert data
      table[pos] = DataRow(
        cells: [
          DataCell(
              Text(
                "$rank ${widget.teamIds[widget.json[index]["teamId"]][1]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ), onTap: () {
            // dynamic teamJson;
            // if ((Provider.of<JsonFiles>(context, listen: false)
            //             .getEastStandings() !=
            //         null &&
            //     Provider.of<JsonFiles>(context, listen: false)
            //             .getWestStandings() !=
            //         null)) {
            //   if (widget.json[index]["conference"]["name"] == "east") {
            //     teamJson = Provider.of<JsonFiles>(context, listen: false)
            //         .getEastStandings()["api"]["standings"][index];
            //   } else if (widget.json[index]["conference"]["name"] == "west") {
            //     teamJson = Provider.of<JsonFiles>(context, listen: false)
            //         .getWestStandings()["api"]["standings"][index];
            //   }
            // }
            var teamId = widget.json[index]["teamId"];
            print(teamId);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamDetails(
                  teamurl: allTeams[teamId][2],
                  json: widget.json[index], //teamJson,
                  fullName: allTeams[teamId][0],
                  shortName: allTeams[teamId][1],
                  triCode: allTeams[teamId][4],
                  nbaTeamId: allTeams[teamId][5],
                ),
              ),
            );
          }),
          DataCell(
            Text(
              "${widget.json[index]["win"]}".trim(),
              style: TextStyle(fontSize: 12),
            ), //
          ),
          DataCell(
            Text(
              "${widget.json[index]["loss"]}",
              style: TextStyle(fontSize: 12),
            ),
          ),
          DataCell(
            Text(
              "${widget.json[index]["winPercentage"]}",
              style: TextStyle(fontSize: 12),
            ),
          ),
          DataCell(
            Text(
              "${widget.json[index]["gamesBehind"]}",
              style: TextStyle(fontSize: 12),
            ),
          ),
          DataCell(
            Text(
              "${widget.json[index]["streak"]}",
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
