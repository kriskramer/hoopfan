import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class PlayerSplitsGeneralTable extends StatelessWidget {
  final String playerId;

  PlayerSplitsGeneralTable({this.playerId});

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
                  'General Splits',
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
      for (int j = 0; j < json[i]["rowSet"].length; j++) {
        rows.add(DataRow(cells: [
          DataCell(Text(json[i]["rowSet"][j][0].toString())),
          DataCell(Text(json[i]["rowSet"][j][1].toString())),
          DataCell(Text(json[i]["rowSet"][j][2].toString())),
          DataCell(Text(json[i]["rowSet"][j][3].toString())),
          DataCell(Text(json[i]["rowSet"][j][4].toString())),
          DataCell(Text(json[i]["rowSet"][j][5].toString())),
          DataCell(Text(double.parse(json[i]["rowSet"][j][6].toString())
              .toStringAsFixed(2))),
          DataCell(Text(json[i]["rowSet"][j][7].toString())),
          DataCell(Text(json[i]["rowSet"][j][8].toString())),
          DataCell(Text(json[i]["rowSet"][j][9].toString())),
          DataCell(Text(json[i]["rowSet"][j][10].toString())),
          DataCell(Text(json[i]["rowSet"][j][11].toString())),
          DataCell(Text(json[i]["rowSet"][j][12].toString())),
          DataCell(Text(json[i]["rowSet"][j][13].toString())),
          DataCell(Text(json[i]["rowSet"][j][14].toString())),
          DataCell(Text(json[i]["rowSet"][j][15].toString())),
          DataCell(Text(json[i]["rowSet"][j][16].toString())),
          DataCell(Text(json[i]["rowSet"][j][17].toString())),
          DataCell(Text(json[i]["rowSet"][j][18].toString())),
          DataCell(Text(json[i]["rowSet"][j][19].toString())),
          DataCell(Text(json[i]["rowSet"][j][20].toString())),
          DataCell(Text(json[i]["rowSet"][j][21].toString())),
          DataCell(Text(json[i]["rowSet"][j][22].toString())),
          DataCell(Text(json[i]["rowSet"][j][23].toString())),
          DataCell(Text(json[i]["rowSet"][j][24].toString())),
          DataCell(Text(json[i]["rowSet"][j][25].toString())),
          DataCell(Text(json[i]["rowSet"][j][26].toString())),
          DataCell(Text(json[i]["rowSet"][j][27].toString())),
        ]));
      }
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
        DataColumn(label: Text('Value')),
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
    print(playerId);

    if (Provider.of<JsonFiles>(context, listen: false)
            .getPlayerSplitsGeneral(playerId) ==
        null) {
      json = Network.getJson(
        Urls.getNbaStatsPlayerSplitsGeneral(playerId),
        requestHeaders: RequestHeaders.nbaStatsHeaders,
      );

      Provider.of<JsonFiles>(context, listen: false)
          .setPlayerSplitsGeneral(playerId, json);
    } else {
      json = Provider.of<JsonFiles>(context, listen: false)
          .getPlayerSplitsGeneral(playerId);
    }

    return json;
  }
}
