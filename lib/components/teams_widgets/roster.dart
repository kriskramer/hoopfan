import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/players/player_detail.dart';
import 'package:provider/provider.dart';

class Roster extends StatelessWidget {
  final dynamic json;
  Roster({this.json});
  List<List<DataRow>> roster(BuildContext ctx) {
    List<DataRow> playerNames = [];
    List<DataRow> playerAttributes = [];
    for (int index = 0; index < json.length; index++) {
      dynamic player = json[index];
      //Map league = player["leagues"];
      if (player["isActive"]) {
        // && league.keys.contains("standard")) {
        playerNames.add(
          DataRow(
            cells: [
              DataCell(
                  Text(
                    "${player["firstName"]} ${player["lastName"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ), onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (context) => PlayerDetail(json: player),
                  ),
                );
              }),
            ],
          ),
        );

        playerAttributes.add(
          DataRow(
            cells: [
              DataCell(
                Text(
                  player["pos"].toString().isEmpty ? "-" : "${player["pos"]}",
                ),
              ),
              DataCell(
                Text(
                  player["jersey"].toString().isEmpty
                      ? "-"
                      : "${player["jersey"]}",
                ),
              ),
              DataCell(
                Text(
                  player["heightFeet"].toString().isEmpty
                      ? "-"
                      : "${player["heightFeet"]}\' ${player["heightInches"]}\"",
                ),
              ),
              DataCell(
                Text(
                  player["weightPounds"].toString().isEmpty
                      ? "-"
                      : "${player["weightPounds"]}",
                ),
              ),
              DataCell(
                Text(
                  player["yearsPro"].toString().isEmpty
                      ? "-"
                      : "${player["yearsPro"]}",
                ),
              ),
              DataCell(
                Text(
                  player["lastAffiliation"].toString().isEmpty
                      ? "-"
                      : "${player["lastAffiliation"]}",
                ),
              ),
            ],
          ),
        );
      }
    }
    return [playerNames, playerAttributes];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DataTable(
          columns: [
            DataColumn(
              label: Text("Name"),
            ),
          ],
          rows: roster(context)[0],
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'Pos',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'No',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ht',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Wt',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Yrs',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'From',
                  ),
                ),
              ],
              rows: roster(context)[1],
            ),
          ),
        ),
      ],
    );
  }
}
