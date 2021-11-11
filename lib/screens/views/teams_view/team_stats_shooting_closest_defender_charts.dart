import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsShootingClosestDefenderCharts extends StatefulWidget {
  final dynamic data;
  const TeamStatsShootingClosestDefenderCharts(this.data);

  @override
  _TeamStatsShootingClosestDefenderChartsState createState() =>
      _TeamStatsShootingClosestDefenderChartsState();
}

class _TeamStatsShootingClosestDefenderChartsState
    extends State<TeamStatsShootingClosestDefenderCharts> {
  @override
  Widget build(BuildContext context) {
    List<TeamStatsShootingClosestDefenderShooting> dataList = [];

    for (var s in widget.data[0]["resultSets"][3]["rowSet"]) {
      dataList.add(TeamStatsShootingClosestDefenderShooting(s));
    }

    List<charts.Series<TeamStatsShootingClosestDefenderShooting, String>>
        seriesFreqFga = [
      charts.Series(
          id: "freqFga",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fga,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.dist.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<TeamStatsShootingClosestDefenderShooting, String>>
        seriesFreqFgm = [
      charts.Series(
          id: "freqFgm",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fgm,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.dist.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.amber))
    ];

    List<charts.Series<TeamStatsShootingClosestDefenderShooting, String>>
        seriesStackedAll = [
      charts.Series(
          id: "fga",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fga,
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.fga.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fgm,
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.fgm.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<TeamStatsShootingClosestDefenderShooting, String>>
        seriesStacked2P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fga2,
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.fga2.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fgm2,
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.fgm3.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<TeamStatsShootingClosestDefenderShooting, String>>
        seriesStacked3P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fga3,
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.fga3.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.dist.toString(),
          measureFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              series.fgm3,
          labelAccessorFn:
              (TeamStatsShootingClosestDefenderShooting series, _) =>
                  '${series.fgm3.toString()}',
          colorFn: (TeamStatsShootingClosestDefenderShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("General Shooting Charts"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(20),
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
                              child: charts.PieChart(
                                seriesFreqFga,
                                animate: true,
                                defaultRenderer: new charts.ArcRendererConfig(
                                    arcRendererDecorators: [
                                      new charts.ArcLabelDecorator(
                                          labelPosition:
                                              charts.ArcLabelPosition.auto)
                                    ]),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 250,
                        child: Column(
                          children: [
                            Text(
                              "Field Goals Made",
                              //style: Theme.of(context).textTheme.body2,
                            ),
                            Expanded(
                              child: charts.PieChart(
                                seriesFreqFgm,
                                animate: true,
                                defaultRenderer: new charts.ArcRendererConfig(
                                    arcRendererDecorators: [
                                      new charts.ArcLabelDecorator(
                                          labelPosition:
                                              charts.ArcLabelPosition.auto)
                                    ]),
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
                          "Field Goals - Total",
                          //style: Theme.of(context).textTheme.body2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            seriesStackedAll,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            behaviors: [new charts.SeriesLegend()],
                            barRendererDecorator:
                                new charts.BarLabelDecorator<String>(),
                            // Hide domain axis.
                            // domainAxis: new charts.OrdinalAxisSpec(
                            //     renderSpec: new charts.NoneRenderSpec()),
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
                          "Field Goals - 2P",
                          //style: Theme.of(context).textTheme.body2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            seriesStacked2P,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            behaviors: [new charts.SeriesLegend()],
                            barRendererDecorator:
                                new charts.BarLabelDecorator<String>(),
                            // Hide domain axis.
                            // domainAxis: new charts.OrdinalAxisSpec(
                            //     renderSpec: new charts.NoneRenderSpec()),
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
                          "Field Goals - 3P",
                          //style: Theme.of(context).textTheme.body2,
                        ),
                        Expanded(
                          child: charts.BarChart(
                            seriesStacked3P,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            behaviors: [new charts.SeriesLegend()],
                            barRendererDecorator:
                                new charts.BarLabelDecorator<String>(),
                            // Hide domain axis.
                            // domainAxis: new charts.OrdinalAxisSpec(
                            //     renderSpec: new charts.NoneRenderSpec()),
                            vertical: false,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            )));
  }
}

class TeamStatsShootingClosestDefenderShooting {
  var dist;
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

  TeamStatsShootingClosestDefenderShooting(dynamic json) {
    dist = json[4].toString();
    fgaFrequency = getDoubleFromJson(json[5]);
    fgm = getDoubleFromJson(json[6]);
    fga = getDoubleFromJson(json[7]);
    fgPct = getDoubleFromJson(json[8]);
    eFgPct = getDoubleFromJson(json[9]);
    fga2Frequency = getDoubleFromJson(json[10]);
    fgm2 = getDoubleFromJson(json[11]);
    fga2 = getDoubleFromJson(json[12]);
    fgPct2 = getDoubleFromJson(json[13]);
    fga3Frequency = getDoubleFromJson(json[14]);
    fgm3 = getDoubleFromJson(json[15]);
    fga3 = getDoubleFromJson(json[16]);
    fgPct3 = getDoubleFromJson(json[17]);
  }

  double getDoubleFromJson(var value) {
    String s = value.toString();
    double d = double.tryParse(s);

    if (d == null) {
      return 0.0;
    } else {
      return d;
    }
  }
}

class TeamStatsShootingClosestDefenderShootingList {
  List<TeamStatsShootingClosestDefenderShooting> items = [];

  TeamStatsShootingClosestDefenderShootingList(dynamic json) {
    for (var s in json) {
      items.add(TeamStatsShootingClosestDefenderShooting(s));
    }
  }
}
