import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PlayerStatsShootingTouchTImeCharts extends StatefulWidget {
  final dynamic data;
  const PlayerStatsShootingTouchTImeCharts(this.data);

  @override
  _PlayerStatsShootingTouchTImeChartsState createState() =>
      _PlayerStatsShootingTouchTImeChartsState();
}

class _PlayerStatsShootingTouchTImeChartsState
    extends State<PlayerStatsShootingTouchTImeCharts> {
  @override
  Widget build(BuildContext context) {
    List<PlayerStatsShootingTouchTImeShooting> dataList = [];

    for (var s in widget.data[0][6]["rowSet"]) {
      dataList.add(PlayerStatsShootingTouchTImeShooting(s));
    }

    List<charts.Series<PlayerStatsShootingTouchTImeShooting, String>>
        seriesFreqFga = [
      charts.Series(
          id: "freqFga",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fga,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.type.toString().replaceAll("Touch ", "")}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<PlayerStatsShootingTouchTImeShooting, String>>
        seriesFreqFgm = [
      charts.Series(
          id: "freqFgm",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fgm,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.type.toString().replaceAll("Touch ", "")}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.amber))
    ];

    List<charts.Series<PlayerStatsShootingTouchTImeShooting, String>>
        seriesStackedAll = [
      charts.Series(
          id: "fga",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fga,
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.fga.toString()}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fgm,
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.fgm.toString()}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<PlayerStatsShootingTouchTImeShooting, String>>
        seriesStacked2P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fga2,
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.fga2.toString()}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fgm2,
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.fgm3.toString()}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<PlayerStatsShootingTouchTImeShooting, String>>
        seriesStacked3P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fga3,
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.fga3.toString()}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.type.toString().replaceAll("Touch ", ""),
          measureFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              series.fgm3,
          labelAccessorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              '${series.fgm3.toString()}',
          colorFn: (PlayerStatsShootingTouchTImeShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Touch Time Charts"),
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

class PlayerStatsShootingTouchTImeShooting {
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

  PlayerStatsShootingTouchTImeShooting(dynamic json) {
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

class PlayerStatsShootingTouchTImeShootingList {
  List<PlayerStatsShootingTouchTImeShooting> items = [];

  PlayerStatsShootingTouchTImeShootingList(dynamic json) {
    for (var s in json) {
      items.add(PlayerStatsShootingTouchTImeShooting(s));
    }
  }
}
