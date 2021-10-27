import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class PlayerGameLogTable extends StatefulWidget {
  final String playerId;
  final String season;
  final String teamId;

  PlayerGameLogTable({this.playerId, this.season, this.teamId});

  @override
  _PlayerGameLogTableState createState() => _PlayerGameLogTableState();
}

class _PlayerGameLogTableState extends State<PlayerGameLogTable> {
  @override
  Widget build(BuildContext context) {
    var teamColor = ConstantHelper.getTeamColor(widget.teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(widget.teamId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game Log',
          style: TextStyle(color: Color(teamTextColor)),
        ),
        backgroundColor: teamColor != null
            ? Color(teamColor)
            : Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var json = snapshot.data["resultSets"][0]["rowSet"];
              return Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: getGameLogTable(json),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              );
            } else {
              return NoConnection();
            }
          },
        ),
      ),
    );
  }

  DataTable getGameLogTable(dynamic json) {
    List<DataRow> rows = [];

    for (var s in json) {
      rows.add(DataRow(cells: [
        DataCell(Text(s[3].toString())),
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
        DataCell(Text(s[19].toString())),
        DataCell(Text(s[20].toString())),
        DataCell(Text(s[21].toString())),
        DataCell(Text(s[22].toString())),
        DataCell(Text(s[23].toString())),
        DataCell(Text(s[24].toString())),
        DataCell(Text(s[25].toString())),
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
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Matchup')),
        DataColumn(label: Text('WL')),
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
        DataColumn(label: Text('REB')),
        DataColumn(label: Text('Asts')),
        DataColumn(label: Text('Stls')),
        DataColumn(label: Text('Blks')),
        DataColumn(label: Text('TOs')),
        DataColumn(label: Text('PF')),
        DataColumn(label: Text('Pts')),
        DataColumn(label: Text('+/-')),
      ],
      rows: [
        ...rows,
      ],
    );
  }

  Future<dynamic> loadData() async {
    dynamic json;

    String seasonString = '';

    int year = int.parse(widget.season);
    int yearPlus = year + 1;
    seasonString = widget.season + "-" + yearPlus.toString().substring(2, 4);

    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getPlayerGameLog(playerId) ==
    //     null) {
    //   json = Network.getJsonFromNbaStats(
    //       Urls.getNbaStatsPlayerShotTypes(playerId));

    //   Provider.of<JsonFiles>(context, listen: false)
    //       .setPlayerShotTypes(playerId, json);
    // } else {
    //   json = Provider.of<JsonFiles>(context, listen: false)
    //       .getPlayerShotTypes(playerId);
    // }
    json = Network.getJson(
      Urls.getNbaStatsPlayerGameLog(widget.playerId, seasonString),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    return json;
  }
}
