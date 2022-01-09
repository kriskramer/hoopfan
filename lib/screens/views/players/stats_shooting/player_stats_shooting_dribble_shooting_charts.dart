import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PlayerStatsShootingDribbleShootingCharts extends StatefulWidget {
  final dynamic data;
  const PlayerStatsShootingDribbleShootingCharts(this.data);

  @override
  _PlayerStatsShootingDribbleShootingChartsState createState() =>
      _PlayerStatsShootingDribbleShootingChartsState();
}

class _PlayerStatsShootingDribbleShootingChartsState
    extends State<PlayerStatsShootingDribbleShootingCharts> {
  @override
  Widget build(BuildContext context) {
    List<PlayerStatsShootingDribbleShootingShooting> dataList = [];

    for (var s in widget.data[0][3]["rowSet"]) {
      dataList.add(PlayerStatsShootingDribbleShootingShooting(s));
    }

    List<charts.Series<PlayerStatsShootingDribbleShootingShooting, String>>
        seriesFreqFga = [
      charts.Series(
          id: "freqFga",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fga,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.type.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<PlayerStatsShootingDribbleShootingShooting, String>>
        seriesFreqFgm = [
      charts.Series(
          id: "freqFgm",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fgm,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.type.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.amber))
    ];

    List<charts.Series<PlayerStatsShootingDribbleShootingShooting, String>>
        seriesStackedAll = [
      charts.Series(
          id: "fga",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fga,
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.fga.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fgm,
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.fgm.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<PlayerStatsShootingDribbleShootingShooting, String>>
        seriesStacked2P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fga2,
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.fga2.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fgm2,
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.fgm3.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<PlayerStatsShootingDribbleShootingShooting, String>>
        seriesStacked3P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fga3,
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.fga3.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.type.toString(),
          measureFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              series.fgm3,
          labelAccessorFn:
              (PlayerStatsShootingDribbleShootingShooting series, _) =>
                  '${series.fgm3.toString()}',
          colorFn: (PlayerStatsShootingDribbleShootingShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Dribble Shooting Charts"),
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

class PlayerStatsShootingDribbleShootingShooting {
  var type;
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

  PlayerStatsShootingDribbleShootingShooting(dynamic json) {
    type = json[5].toString();
    fgaFrequency = getDoubleFromJson(json[6]);
    fgm = getDoubleFromJson(json[7]);
    fga = getDoubleFromJson(json[8]);
    fgPct = getDoubleFromJson(json[9]);
    eFgPct = getDoubleFromJson(json[10]);
    fga2Frequency = getDoubleFromJson(json[11]);
    fgm2 = getDoubleFromJson(json[12]);
    fga2 = getDoubleFromJson(json[13]);
    fgPct2 = getDoubleFromJson(json[14]);
    fga3Frequency = getDoubleFromJson(json[15]);
    fgm3 = getDoubleFromJson(json[16]);
    fga3 = getDoubleFromJson(json[17]);
    fgPct3 = getDoubleFromJson(json[18]);
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

class PlayerStatsShootingDribbleShootingShootingList {
  List<PlayerStatsShootingDribbleShootingShooting> items = [];

  PlayerStatsShootingDribbleShootingShootingList(dynamic json) {
    for (var s in json) {
      items.add(PlayerStatsShootingDribbleShootingShooting(s));
    }
  }
}
