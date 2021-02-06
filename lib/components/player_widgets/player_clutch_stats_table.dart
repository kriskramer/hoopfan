import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerClutchStatsTable extends StatelessWidget {
  final String playerId;

  PlayerClutchStatsTable({this.playerId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var json = snapshot.data["resultSets"];

            return Column(
              children: [
                Text(
                  'Clutch Stats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getStatsTable(json),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            );
          } else {
            return NoConnection();
          }
        });
  }

  DataTable getStatsTable(dynamic json) {
    List<DataRow> rows = List<DataRow>();

    for (int i = 0; i < json.length; i++) {
      rows.add(DataRow(cells: [
        DataCell(Text(json[i]["rowSet"][0][0].toString())),
        DataCell(Text(json[i]["rowSet"][0][2].toString())),
        DataCell(Text(json[i]["rowSet"][0][3].toString())),
        DataCell(Text(json[i]["rowSet"][0][4].toString())),
        DataCell(Text(json[i]["rowSet"][0][5].toString())),
        DataCell(Text(double.parse(json[i]["rowSet"][0][6].toString())
            .toStringAsFixed(2))),
        DataCell(Text(json[i]["rowSet"][0][7].toString())),
        DataCell(Text(json[i]["rowSet"][0][8].toString())),
        DataCell(Text(json[i]["rowSet"][0][9].toString())),
        DataCell(Text(json[i]["rowSet"][0][10].toString())),
        DataCell(Text(json[i]["rowSet"][0][11].toString())),
        DataCell(Text(json[i]["rowSet"][0][12].toString())),
        DataCell(Text(json[i]["rowSet"][0][13].toString())),
        DataCell(Text(json[i]["rowSet"][0][14].toString())),
        DataCell(Text(json[i]["rowSet"][0][15].toString())),
        DataCell(Text(json[i]["rowSet"][0][16].toString())),
        DataCell(Text(json[i]["rowSet"][0][17].toString())),
        DataCell(Text(json[i]["rowSet"][0][18].toString())),
        DataCell(Text(json[i]["rowSet"][0][19].toString())),
        DataCell(Text(json[i]["rowSet"][0][20].toString())),
        DataCell(Text(json[i]["rowSet"][0][21].toString())),
        DataCell(Text(json[i]["rowSet"][0][22].toString())),
        DataCell(Text(json[i]["rowSet"][0][23].toString())),
        DataCell(Text(json[i]["rowSet"][0][24].toString())),
        DataCell(Text(json[i]["rowSet"][0][25].toString())),
        DataCell(Text(json[i]["rowSet"][0][26].toString())),
        DataCell(Text(json[i]["rowSet"][0][27].toString())),
      ]));
    }

    return DataTable(
      columnSpacing: 15,
      horizontalMargin: 5,
      dataRowHeight: 28,
      headingRowHeight: 30,
      headingTextStyle:
          TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
      headingRowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.grey[300]; // Use the default value.
      }),
      columns: [
        DataColumn(label: Text('Group')),
        DataColumn(label: Text('G')),
        DataColumn(label: Text('W')),
        DataColumn(label: Text('L')),
        DataColumn(label: Text('W %')),
        DataColumn(label: Text('Min')),
        DataColumn(label: Text('FGM')),
        DataColumn(label: Text('FGA')),
        DataColumn(label: Text('FG %')),
        DataColumn(label: Text('3PM')),
        DataColumn(label: Text('3PA')),
        DataColumn(label: Text('3P %')),
        DataColumn(label: Text('FTM')),
        DataColumn(label: Text('FTA')),
        DataColumn(label: Text('FT %')),
        DataColumn(label: Text('OReb')),
        DataColumn(label: Text('DReb')),
        DataColumn(label: Text('Rebs')),
        DataColumn(label: Text('Asts')),
        DataColumn(label: Text('TOs')),
        DataColumn(label: Text('Stls')),
        DataColumn(label: Text('Blks')),
        DataColumn(label: Text('BlkA')),
        DataColumn(label: Text('PF')),
        DataColumn(label: Text('PFD')),
        DataColumn(label: Text('Pts')),
        DataColumn(label: Text('+/-')),
      ],
      rows: [
        ...rows,
      ],
    );
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;

    if (Provider.of<JsonFiles>(context, listen: false)
            .getPlayerClutchStats(playerId) ==
        null) {
      json = Network.getJsonFromNbaStats(
          Urls.getNbaStatsPlayerClutchStats(playerId));

      Provider.of<JsonFiles>(context, listen: false)
          .setPlayerClutchStats(playerId, json);
    } else {
      json = Provider.of<JsonFiles>(context, listen: false)
          .getPlayerClutchStats(playerId);
    }

    return json;
  }
}
