import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsShootingGeneralCharts extends StatefulWidget {
  final dynamic data;
  const TeamStatsShootingGeneralCharts(this.data);

  @override
  _TeamStatsShootingGeneralChartsState createState() =>
      _TeamStatsShootingGeneralChartsState();
}

class _TeamStatsShootingGeneralChartsState
    extends State<TeamStatsShootingGeneralCharts> {
  @override
  Widget build(BuildContext context) {
    List<TeamStatsShootingGeneralShooting> dataList = [];

    for (var s in widget.data[0]["resultSets"][0]["rowSet"]) {
      dataList.add(TeamStatsShootingGeneralShooting(s));
    }

    List<charts.Series<TeamStatsShootingGeneralShooting, String>>
        seriesFreqFga = [
      charts.Series(
          id: "freqFga",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) => series.fga,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.type.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<TeamStatsShootingGeneralShooting, String>>
        seriesFreqFgm = [
      charts.Series(
          id: "freqFgm",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) => series.fgm,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.type.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.amber))
    ];

    List<charts.Series<TeamStatsShootingGeneralShooting, String>>
        seriesStackedAll = [
      charts.Series(
          id: "fga",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) => series.fga,
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.fga.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) => series.fgm,
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.fgm.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<TeamStatsShootingGeneralShooting, String>>
        seriesStacked2P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.fga2,
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.fga2.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.fgm2,
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.fgm3.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.orange))
    ];

    List<charts.Series<TeamStatsShootingGeneralShooting, String>>
        seriesStacked3P = [
      charts.Series(
          id: "fga2",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.fga3,
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.fga3.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lime)),
      charts.Series(
          id: "fgm2",
          data: dataList,
          domainFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.type.toString(),
          measureFn: (TeamStatsShootingGeneralShooting series, _) =>
              series.fgm3,
          labelAccessorFn: (TeamStatsShootingGeneralShooting series, _) =>
              '${series.fgm3.toString()}',
          colorFn: (TeamStatsShootingGeneralShooting series, _) =>
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

class TeamStatsShootingGeneralShooting {
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

  TeamStatsShootingGeneralShooting(dynamic json) {
    type = json[4].toString();
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

class TeamStatsShootingGeneralShootingList {
  List<TeamStatsShootingGeneralShooting> items = [];

  TeamStatsShootingGeneralShootingList(dynamic json) {
    for (var s in json) {
      items.add(TeamStatsShootingGeneralShooting(s));
    }
  }
}
