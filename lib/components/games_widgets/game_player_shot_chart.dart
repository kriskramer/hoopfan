import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/models/game_feed/pbp_item.dart';
import 'package:hoop/models/shot_chart.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

import '../../json/jsons.dart';

class GamePlayerShotChart extends StatefulWidget {
  final playerId;
  final teamId;
  final gameId;

  const GamePlayerShotChart(this.playerId, this.teamId, this.gameId);

  @override
  State<GamePlayerShotChart> createState() => _GamePlayerShotChartState();
}

class _GamePlayerShotChartState extends State<GamePlayerShotChart> {
  bool showShots = true;
  bool showZones = false;
  bool showPeriods = false;

  int currentPeriod = 1;
  int periodCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Game Shot Chart")),
        body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //dynamic player = snapshot.data["resultSets"][0]["rowSet"];
              //dynamic league = snapshot.data["resultSets"][1]["rowSet"];

              FeedList2 list = Provider.of<JsonFiles>(context, listen: false)
                  .getPbpFeed(widget.gameId.toString());

              FeedList2 playerList = list.getByPlayer(widget.playerId);

              //PlayerShotChartList listPlayer = PlayerShotChartList(player);
              //PlayerShotChartList listLeague = PlayerShotChartList(league);

              List<Widget> shotWidgets = [];

              if (showShots) {
                shotWidgets.add(getTitleSection("All Shots"));
              }

              playerList.items.forEach((e) {
                if (showPeriods) {
                  if (e.period != currentPeriod) {
                    currentPeriod = e.period;
                    shotWidgets
                        .add(getTitleSection("Period ${e.period.toString()}"));
                  }
                }
                shotWidgets.add(getShotCard(e));
              });

              List<charts.Series<PbpItem2, num>> seriesShots = [
                charts.Series(
                    id: "shots",
                    data: playerList.items,
                    domainFn: (PbpItem2 series, _) => series.y,
                    measureFn: (PbpItem2 series, _) => series.x,
                    // Set a label accessor to control the text of the arc label.
                    // labelAccessorFn: (PlayerShotChart series, _) =>
                    //     '${series.locX.toString()}',
                    colorFn: (PbpItem2 shots, _) {
                      return shots.shotResult == "Made"
                          ? charts.MaterialPalette.green.shadeDefault
                          : charts.MaterialPalette.red.shadeDefault;
                    }),
              ];

              return SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(width: 1, color: Colors.grey[400]))),
                    child: Column(children: [
                      // Container(
                      //   height: 350,
                      //   width: double.infinity,
                      //   child: Stack(
                      //     children: [
                      //       Image.asset("images/shot_chart_background.png",
                      //           fit: BoxFit.fill),
                      //       charts.ScatterPlotChart(
                      //         seriesShots,
                      //         animate: true,
                      //         behaviors: [new charts.SeriesLegend()],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showPeriods = false;
                                  showShots = true;
                                  showZones = false;
                                });
                              },
                              child: Text("Shots")),
                          ElevatedButton(onPressed: () {}, child: Text("Zone")),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showPeriods = true;
                                  showShots = false;
                                  showZones = false;
                                });
                              },
                              child: Text("Period")),
                        ],
                      ),
                      ...shotWidgets
                    ])),
              );
            } else
              return Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    "No data yet. Shot chart data is usually populated after the game."),
              );
          },
        ));
  }

  Future<void> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsPlayerShotChart(
          widget.playerId, widget.teamId, widget.gameId),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }

  Container getTitleSection(String text) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget getShotCard(PbpItem2 e) {
    bool madeShot = e.shotResult == "Made" ? true : false;

    return e.isFieldGoal == 1
        ? Card(
            elevation: 6,
            borderOnForeground: true,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            color: madeShot ? Colors.green[200] : Colors.red[200],
            child: Container(
              padding: EdgeInsets.all(5),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(e.actionType),
                          Text(e.subType),
                          Text(
                              "Coords: ${e.x.toStringAsFixed(2)}, ${e.y.toStringAsFixed(2)}"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(e.area),
                          Text(e.areaDetail),
                          Text("dist: " + e.shotDistance.toString()),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            ConstantHelper.getPeriodText(e.period.toString()),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(e.clockFormatted().toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ]),
            ),
          )
        : SizedBox();
  }
}
