import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsShootingCharts extends StatefulWidget {
  final dynamic data;
  const TeamStatsShootingCharts(this.data);

  @override
  _TeamStatsShootingChartsState createState() =>
      _TeamStatsShootingChartsState();
}

class _TeamStatsShootingChartsState extends State<TeamStatsShootingCharts> {
  @override
  Widget build(BuildContext context) {
    List<TeamStatsShootingShotClockShooting> dataList = [];

    for (var s in widget.data[0]["resultSets"][1]["rowSet"]) {
      dataList.add(TeamStatsShootingShotClockShooting(s));
    }

    List<charts.Series<TeamStatsShootingShotClockShooting, String>> seriesFga =
        [
      charts.Series(
          id: "fga",
          data: dataList,
          domainFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.range.toString().split(" ")[0],
          measureFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.fga,
          colorFn: (TeamStatsShootingShotClockShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime))
    ];

    List<charts.Series<TeamStatsShootingShotClockShooting, String>> seriesFgm =
        [
      charts.Series(
          id: "fgm",
          data: dataList,
          domainFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.range.toString().split(" ")[0],
          measureFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.fgm,
          colorFn: (TeamStatsShootingShotClockShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<TeamStatsShootingShotClockShooting, String>>
        seriesStacked = [
      charts.Series(
          id: "fga",
          data: dataList,
          domainFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.range.toString().split(" ")[0],
          measureFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.fga,
          colorFn: (TeamStatsShootingShotClockShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm",
          data: dataList,
          domainFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.range.toString().split(" ")[0],
          measureFn: (TeamStatsShootingShotClockShooting series, _) =>
              series.fgm,
          colorFn: (TeamStatsShootingShotClockShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Charts"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(25),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(children: <Widget>[
                    Container(
                        height: 250,
                        child: Column(
                          children: [
                            Text(
                              "Field Goals Attempted",
                              //style: Theme.of(context).textTheme.body2,
                            ),
                            Expanded(
                              child: charts.BarChart(
                                seriesFga,
                                animate: true,
                                vertical: false,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      child: Column(children: [
                        Text(
                          "Field Goals Made",
                          //style: Theme.of(context).textTheme.body2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            seriesFgm,
                            animate: true,
                            vertical: false,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      child: Column(children: [
                        Text(
                          "Field Goals Made",
                          //style: Theme.of(context).textTheme.body2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            seriesStacked,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //vertical: false,
                          ),
                        )
                      ]),
                    ),
                  ]),
                ),
              ),
            )));
  }
}

class TeamStatsShootingShotClockShooting {
  var range;
  var fgaFrequency;
  var fgm;
  var fga;
  var fgPct;
  var eFgPct;
  var fga2Frequency;
  var fgm2;
  var fga2;
  var fgPct2;
  var fga3Frequency;
  var fgm3;
  var fga3;
  var fgPct3;

  //var barColor;

  TeamStatsShootingShotClockShooting(dynamic json) {
    range = json[4].toString();
    fgaFrequency = double.parse(json[5].toString());
    fgm = int.parse(json[6].toString());
    fga = int.parse(json[7].toString());
    fgPct = json[8].toString();
    eFgPct = json[9].toString();
    fga2Frequency = json[10].toString();
    fgm2 = json[11].toString();
    fga2 = json[12].toString();
    fgPct2 = json[13].toString();
    fga3Frequency = json[14].toString();
    fgm3 = json[15].toString();
    fga3 = json[16].toString();
    fgPct3 = json[17].toString();
    //barColor = charts.ColorUtil.fromDartColor(Colors.orange);
  }
}

class TeamStatsShootingShotClockShootingList {
  List<TeamStatsShootingShotClockShooting> items = [];

  TeamStatsShootingShotClockShootingList(dynamic json) {
    for (var s in json) {
      items.add(TeamStatsShootingShotClockShooting(s));
    }
  }
}
