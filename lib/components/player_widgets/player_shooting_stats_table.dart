import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/screens/views/players/player_stats_shooting_closest_defender_charts.dart';
import 'package:hoop/screens/views/players/player_stats_shooting_dribble_shooting_charts.dart';
import 'package:hoop/screens/views/players/player_stats_shooting_general_charts.dart';
import 'package:hoop/screens/views/players/player_stats_shooting_shot_clock_charts.dart';
import 'package:hoop/screens/views/players/player_stats_shooting_touch_time_charts.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class PlayerShootingStatsTable extends StatelessWidget {
  final String playerId;
  final String perMode;

  PlayerShootingStatsTable({this.playerId, this.perMode});

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
                  'Overall',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[0]["rowSet"]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'General Shooting',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[1]["rowSet"]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerStatsShootingGeneralCharts([json]),
                          ));
                    },
                    child: Text("Charts")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Shot Clock Shooting',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[2]["rowSet"]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerStatsShootingShotClockCharts([json]),
                          ));
                    },
                    child: Text("Charts")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Dribble Shooting',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[3]["rowSet"]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerStatsShootingDribbleShootingCharts(
                                    [json]),
                          ));
                    },
                    child: Text("Charts")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Closest Defender Shooting',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[4]["rowSet"]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerStatsShootingClosestDefenderCharts(
                                    [json]),
                          ));
                    },
                    child: Text("Charts")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Closest Defender 10ft Plus Shooting',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[5]["rowSet"]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Touch Time Shooting',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: getGeneralShootingTable(json[6]["rowSet"]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerStatsShootingTouchTImeCharts([json]),
                          ));
                    },
                    child: Text("Charts")),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          } else {
            return NoConnection();
          }
        });
  }

  DataTable getGeneralShootingTable(dynamic json) {
    List<DataRow> rows = [];

    for (var s in json) {
      rows.add(DataRow(cells: [
        DataCell(Text(s[4].toString())),
        DataCell(Text(s[5].toString())),
        DataCell(Text(s[6].toString())),
        DataCell(Text(s[7].toString())),
        DataCell(Text(s[8].toString())),
        DataCell(Text(s[9].toString())),
        DataCell(Text(s[10].toString())),
        DataCell(Text(s[11].toString())),
        DataCell(Text(s[12].toString())),
        DataCell(Text(s[13].toString())),
        DataCell(Text(s[14].toString())),
        DataCell(Text(s[15].toString())),
        DataCell(Text(s[16].toString())),
        DataCell(Text(s[17].toString())),
        DataCell(Text(s[18].toString())),
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
        DataColumn(label: Text('G')),
        DataColumn(label: Text('Shot Type')),
        DataColumn(label: Text('FGA Freq')),
        DataColumn(label: StatInfoDialog(label: Text('FGM'), statName: "FGM")),
        DataColumn(label: StatInfoDialog(label: Text('FGA'), statName: "FGA")),
        DataColumn(
            label: StatInfoDialog(label: Text('FG %'), statName: "FG %")),
        DataColumn(
            label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")),
        DataColumn(
            label:
                StatInfoDialog(label: Text('2FG Freq'), statName: "2FG Freq")),
        DataColumn(
            label: StatInfoDialog(label: Text('FG2A'), statName: "FG2A")),
        DataColumn(
            label: StatInfoDialog(label: Text('FG2M'), statName: "FG2M")),
        DataColumn(
            label: StatInfoDialog(label: Text('2FG %'), statName: "2FG%")),
        DataColumn(
            label:
                StatInfoDialog(label: Text('3FG Freq'), statName: "3FG Freq")),
        DataColumn(label: StatInfoDialog(label: Text('3PM'), statName: "3PM")),
        DataColumn(label: StatInfoDialog(label: Text('3PA'), statName: "3PA")),
        DataColumn(
            label: StatInfoDialog(label: Text('3P %'), statName: "3P %")),

        //DataColumn(label: Text('FGM')),
        //DataColumn(label: Text('FGA')),
        //DataColumn(label: Text('FG %')),
        //DataColumn(label: Text('eFG %')),
        //DataColumn(label: Text('FG2A Freq')),
        // DataColumn(label: Text('FG2A')),
        // DataColumn(label: Text('FG2M')),
        //DataColumn(label: Text('FG2 %')),
        //DataColumn(label: Text('3PA Freq')),
        //DataColumn(label: Text('3PM')),
        //DataColumn(label: Text('3PA')),
        //DataColumn(label: Text('3P %')),
      ],
      rows: [
        ...rows,
      ],
    );
  }

  Future<dynamic> loadData(BuildContext context) async {
    dynamic json;

    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getPlayerShotTypes(playerId) ==
    //     null) {
    json = await Network.getJson(
      Urls.getNbaStatsPlayerShotTypes(playerId, perMode: perMode),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    //   Provider.of<JsonFiles>(context, listen: false)
    //       .setPlayerShotTypes(playerId, json);
    // } else {
    //   json = Provider.of<JsonFiles>(context, listen: false)
    //       .getPlayerShotTypes(playerId);
    // }

    return json;
  }
}
