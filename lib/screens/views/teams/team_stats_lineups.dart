import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
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

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Select up to 5 players to fliter lineup data below:'),
          SizedBox(
            height: 20,
          ),
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
                      value:
                          checkedPlayers[allPlayers[index]["personId"]] == null
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
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('GP'), statName: "GP")),
                          DataColumn(
                              label: StatInfoDialog(
                            label: Text('W'),
                            statName: "W",
                          )),
                          DataColumn(
                              label: StatInfoDialog(
                            label: Text('L'),
                            statName: "L",
                          )),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('W %'), statName: "Win %")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('Min'), statName: "MIN")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('FGM'), statName: "FGM")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('FGA'), statName: "FGA")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('FG %'), statName: "FG %")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('3PM'), statName: "3PM")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('3PA'), statName: "3PA")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('3P %'), statName: "3P %")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('FTM'), statName: "FTM")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('FTA'), statName: "FTA")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('FT %'), statName: "FT %")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('OREB'), statName: "OREB")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('DREB'), statName: "DREB")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('REB'), statName: "REB")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('AST'), statName: "AST")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('TOV'), statName: "TOV")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('STL'), statName: "STL")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('BLK'), statName: "BLK")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('BLKA'), statName: "BLKA")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('PF'), statName: "PF")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('PFD'), statName: "PFD")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('PTS'), statName: "PTS")),
                          DataColumn(
                              label: StatInfoDialog(
                                  label: Text('+/-'), statName: "PLUSMINUS")),
                        ],
                        rows: [
                          ...rows.getRange(
                              0, rows.length > 20 ? 20 : rows.length)
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
      )),
    );
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
