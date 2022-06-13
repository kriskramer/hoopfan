import 'package:flutter/material.dart';
import 'package:hoop/screens/views/players/player_detail.dart';

class Roster extends StatelessWidget {
  final dynamic json;
  final int teamColor;

  Roster({@required this.json, this.teamColor});

  List<List<DataRow>> roster(BuildContext ctx) {
    List<DataRow> playerNames = [];
    List<DataRow> playerAttributes = [];
    for (int index = 0; index < json.length; index++) {
      dynamic player = json[index];
      if (player["isActive"]) {
        playerNames.add(
          DataRow(
            cells: [
              DataCell(
                  Text(
                    "${player["firstName"]} ${player["lastName"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ), onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (context) => PlayerDetail(
                      playerId: player["personId"],
                    ),
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
          columnSpacing: 1,
          dataRowHeight: 30,
          headingRowHeight: 20,
          horizontalMargin: 10,
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
              columnSpacing: 12,
              dataRowHeight: 30,
              headingRowHeight: 20,
              horizontalMargin: 10,
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
