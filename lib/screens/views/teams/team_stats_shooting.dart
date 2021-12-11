import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';
import 'package:hoop/screens/views/teams/team_stats_shooting_closest_defender_charts.dart';
import 'package:hoop/screens/views/teams/team_stats_shooting_dribble_charts.dart';
import 'package:hoop/screens/views/teams/team_stats_shooting_general_charts.dart';
import 'package:hoop/screens/views/teams/team_stats_shooting_shot_clock_charts.dart';
import 'package:hoop/screens/views/teams/team_stats_shooting_touch_time_charts.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsShootingView extends StatefulWidget {
  final String teamId;

  TeamStatsShootingView({this.teamId});

  @override
  _TeamStatsShootingViewState createState() => _TeamStatsShootingViewState();
}

class _TeamStatsShootingViewState extends State<TeamStatsShootingView> {
  int _valuePer = 1;
  int _lastNGames = 0;
  String per = "Totals";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return NoConnection();
            }
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Column(children: [SizedBox(height: 20), Text('No data')]);
            }
            if (snapshot.hasData) {
              dynamic stats = snapshot.data;

              //List<charts.Series<dynamic, String>> seriesList;

              return Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                              elevation: 5,
                              value: _valuePer,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Totals"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("PerGame"),
                                  value: 2,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  updatePer(value);
                                });
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Last N Games: '),
                          SizedBox(
                            width: 5,
                          ),
                          DropdownButton(
                              elevation: 5,
                              value: _lastNGames,
                              items: [
                                DropdownMenuItem(
                                  child: Text("All"),
                                  value: 0,
                                ),
                                DropdownMenuItem(
                                  child: Text("1"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("2"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("3"),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Text("4"),
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Text("5"),
                                  value: 5,
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  updateLastNGames(value);
                                });
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'General Shooting',
                      style: TextStyle(fontSize: 20),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15,
                        headingRowHeight: 25,
                        dataRowHeight: 25,
                        headingTextStyle: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                        headingRowColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return Colors.grey[300];
                        }),
                        columns: [
                          DataColumn(label: Text('Shot Type')),
                          ...getColumnHeaders(),
                        ],
                        rows: [
                          getDataRow(stats, 0, 0),
                          getDataRow(stats, 0, 1),
                          getDataRow(stats, 0, 2),
                          getDataRow(stats, 0, 3),
                        ],
                      ),
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
                                    TeamStatsShootingGeneralCharts([stats]),
                              ));
                        },
                        child: Text("Charts")),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Shot Clock Shooting',
                      style: TextStyle(fontSize: 20),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15,
                        headingRowHeight: 25,
                        dataRowHeight: 25,
                        headingTextStyle: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                        headingRowColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return Colors.grey[300];
                        }),
                        columns: [
                          DataColumn(label: Text('Shot Clock Range')),
                          ...getColumnHeaders(),
                        ],
                        rows: [
                          getDataRow(stats, 1, 0),
                          getDataRow(stats, 1, 1),
                          getDataRow(stats, 1, 2),
                          getDataRow(stats, 1, 3),
                          getDataRow(stats, 1, 4),
                          getDataRow(stats, 1, 5),
                        ],
                      ),
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
                                    TeamStatsShootingShotClockCharts([stats]),
                              ));
                        },
                        child: Text("Charts")),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Dribble Shooting',
                      style: TextStyle(fontSize: 20),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15,
                        headingRowHeight: 25,
                        dataRowHeight: 25,
                        headingTextStyle: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                        headingRowColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return Colors.grey[300];
                        }),
                        columns: [
                          DataColumn(label: Text('Dribble Range')),
                          ...getColumnHeaders(),
                        ],
                        rows: [
                          getDataRow(stats, 2, 0),
                          getDataRow(stats, 2, 1),
                          getDataRow(stats, 2, 2),
                          getDataRow(stats, 2, 3),
                          getDataRow(stats, 2, 4),
                        ],
                      ),
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
                                    TeamStatsShootingDribbleCharts([stats]),
                              ));
                        },
                        child: Text("Charts")),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Closest Defender Shooting',
                      style: TextStyle(fontSize: 20),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15,
                        headingRowHeight: 25,
                        dataRowHeight: 25,
                        headingTextStyle: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                        headingRowColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return Colors.grey[300];
                        }),
                        columns: [
                          DataColumn(label: Text('Def Dist')),
                          ...getColumnHeaders(),
                        ],
                        rows: [
                          getDataRow(stats, 3, 0),
                          getDataRow(stats, 3, 1),
                          getDataRow(stats, 3, 2),
                          getDataRow(stats, 3, 3),
                        ],
                      ),
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
                                    TeamStatsShootingClosestDefenderCharts(
                                        [stats]),
                              ));
                        },
                        child: Text("Charts")),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Touch Time Shooting',
                      style: TextStyle(fontSize: 18),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15,
                        headingRowHeight: 25,
                        dataRowHeight: 25,
                        headingTextStyle: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                        headingRowColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return Colors.grey[300];
                        }),
                        columns: [
                          DataColumn(label: Text('Touch Time Range')),
                          ...getColumnHeaders(),
                        ],
                        rows: [
                          getDataRow(stats, 5, 0),
                          getDataRow(stats, 5, 1),
                          getDataRow(stats, 5, 2),
                        ],
                      ),
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
                                    TeamStatsShootingTouchTimeCharts([stats]),
                              ));
                        },
                        child: Text("Charts")),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              );
            } else {
              return NoConnection();
            }
          }),
    );
  }

  Future<dynamic> loadData() async {
    dynamic stats;
    // if (Provider.of<JsonFiles>(context, listen: false)
    //         .getTeamStatsShooting(widget.teamId) ==
    //     null) {
    stats = await Network.getJson(
      Urls.getNbaStatsTeamShotTypes(widget.teamId,
          lastNGames: _lastNGames.toString(), perMode: per),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );

    //   Provider.of<JsonFiles>(context, listen: false)
    //       .setTeamStatsShooting(widget.teamId, stats);
    // } else {
    //   stats = Provider.of<JsonFiles>(context, listen: false)
    //       .getTeamStatsShooting(widget.teamId);
    // }

    return stats;
  }

  List<DataColumn> getColumnHeaders() {
    List<DataColumn> list = [];

    // list.add(DataColumn(label: Text('FGA Freq')));
    // list.add(DataColumn(label: Text('FGM')));
    // list.add(DataColumn(label: Text('FGA')));
    // list.add(DataColumn(label: Text('FG %')));
    // list.add(DataColumn(label: Text('eFG %')));
    // list.add(DataColumn(label: Text('2P Freq')));
    // list.add(DataColumn(label: Text('2PM')));
    // list.add(DataColumn(label: Text('2PA')));
    // list.add(DataColumn(label: Text('2P %')));
    // list.add(DataColumn(label: Text('3P Freq')));
    // list.add(DataColumn(label: Text('3PM')));
    // list.add(DataColumn(label: Text('3PA')));
    // list.add(DataColumn(label: Text('3P %')));

    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FGA Freq'), statName: "FGA Freq")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FGM'), statName: "FGM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FGA'), statName: "FGA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FG %'), statName: "FG %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('2P Freq'), statName: "2P Freq")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('2PM'), statName: "2PM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('2PA'), statName: "2PA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('2P %'), statName: "2P %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('3P FREQ'), statName: "3P FREQ")));

    list.add(
        DataColumn(label: StatInfoDialog(label: Text('3PM'), statName: "3PM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('3PA'), statName: "3PA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('3P %'), statName: "3P %")));

    return list;
  }

  DataRow getDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
      getDataCell(stats, typeNum, setNum, 15),
      getDataCell(stats, typeNum, setNum, 16),
      getDataCell(stats, typeNum, setNum, 17),
    ]);
  }

  DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum) {
    if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    return DataCell(Text(
        stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString()));
  }

  void updatePer(int value) {
    if (value == 1) {
      _valuePer = 1;
      per = "Totals";
    } else if (value == 2) {
      _valuePer = 2;
      per = "PerGame";
    }
  }

  void updateLastNGames(int value) {
    _lastNGames = value;
  }
}
