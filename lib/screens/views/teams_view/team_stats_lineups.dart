import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/team_lineup.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamStatsLineupsView extends StatefulWidget {
  final String teamId;

  TeamStatsLineupsView({this.teamId});

  @override
  _TeamStatsLineupsViewState createState() => _TeamStatsLineupsViewState();
}

class _TeamStatsLineupsViewState extends State<TeamStatsLineupsView> {
  var checkedPlayers = {};
  dynamic lineups;
  dynamic json;
  TeamLineupList list;

  dynamic getTeamRoster(String teamId) {
    var roster = Provider.of<JsonFiles>(context, listen: false)
        .getTeamRoster(widget.teamId);

    if (roster == null) {
      var allPlayers =
          Provider.of<JsonFiles>(context, listen: false).getAllPlayers();

      List<Map> teamRoster = [];
      for (var ap in allPlayers["league"]["standard"]) {
        if (ap["teamId"] == widget.teamId) {
          teamRoster.add(ap);
        }
      }

      roster = teamRoster;
      Provider.of<JsonFiles>(context, listen: false)
          .addTeamPlayers(widget.teamId, teamRoster);
    }

    return roster;
  }

  @override
  Widget build(BuildContext context) {
    var allPlayers = getTeamRoster(widget.teamId);

    return Container(
        child: Column(
      children: [
        Text('Select up to 5 players to fliter lineup data below:'),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 7.5),
            itemCount: allPlayers.length,
            itemBuilder: (context, index) {
              return Container(
                height: 30,
                child: Row(children: [
                  Checkbox(
                    value: checkedPlayers[allPlayers[index]["personId"]] == null
                        ? false
                        : checkedPlayers[allPlayers[index]["personId"]],
                    onChanged: (value) {
                      String playerId = allPlayers[index]["personId"];
                      setState(() {
                        if (value == true) {
                          print(playerId);
                          checkedPlayers[playerId] = true;
                          list.addFilterPlayer(playerId);
                        } else {
                          checkedPlayers[playerId] = false;
                          list.removeFilterPlayer(playerId);
                        }
                      });
                    },
                  ),
                  Expanded(
                      child: Text(allPlayers[index]["temporaryDisplayName"]))
                ]),
              );
            }),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    List<DataRow> rows = [];

                    for (var l in list.items) {
                      rows.add(DataRow(cells: [
                        DataCell(Text(l.GROUP_NAME.toString())),
                        DataCell(Text(l.GP.toString())),
                        DataCell(Text(l.W.toString())),
                        DataCell(Text(l.L.toString())),
                        DataCell(Text(l.W_PCT.toString())),
                        DataCell(Text(l.MIN.toStringAsFixed(2))),
                        DataCell(Text(l.FGM.toString())),
                        DataCell(Text(l.FGA.toString())),
                        DataCell(Text(l.FG_PCT.toString())),
                        DataCell(Text(l.FG3M.toString())),
                        DataCell(Text(l.FG3A.toString())),
                        DataCell(Text(l.FG3_PCT.toString())),
                        DataCell(Text(l.FTM.toString())),
                        DataCell(Text(l.FTA.toString())),
                        DataCell(Text(l.FT_PCT.toString())),
                        DataCell(Text(l.OREB.toString())),
                        DataCell(Text(l.DREB.toString())),
                        DataCell(Text(l.REB.toString())),
                        DataCell(Text(l.AST.toString())),
                        DataCell(Text(l.TOV.toString())),
                        DataCell(Text(l.STL.toString())),
                        DataCell(Text(l.BLK.toString())),
                        DataCell(Text(l.BLKA.toString())),
                        DataCell(Text(l.PF.toString())),
                        DataCell(Text(l.PFD.toString())),
                        DataCell(Text(l.PTS.toString())),
                        DataCell(Text(l.PLUS_MINUS.toString())),
                      ]));
                    }
                    return DataTable(
                      columnSpacing: 15,
                      dataRowHeight: 25,
                      headingRowHeight: 25,
                      columns: [
                        DataColumn(
                            label: Text('Lineup (' +
                                list.items.length.toString() +
                                " total - top 20 shown)")),
                        DataColumn(label: Text('GP')),
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
                        ...rows.getRange(0, rows.length > 20 ? 20 : rows.length)
                      ],
                    );
                  } else {
                    return Text('No data returned...');
                  }
                } else {
                  return NoConnection();
                }
              },
            )),
      ],
    ));
  }

  Future<bool> loadData() async {
    if (list == null) {
      if (Provider.of<JsonFiles>(context, listen: false)
              .getTeamLineups(widget.teamId) ==
          null) {
        lineups = await Network.getJson(
          Urls.getNbaStatsTeamLineups(widget.teamId),
          requestHeaders: RequestHeaders.nbaStatsHeaders,
        );

        Provider.of<JsonFiles>(context, listen: false)
            .setTeamLineups(widget.teamId, lineups);
      }

      json = Provider.of<JsonFiles>(context, listen: false)
          .getTeamLineups(widget.teamId);
      list = TeamLineupList(json);
    }

    return true;
  }
}
