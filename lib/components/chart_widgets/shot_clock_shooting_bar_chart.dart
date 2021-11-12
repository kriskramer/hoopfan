import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ShotClockShootingBarChart extends StatelessWidget {
  final List<ShotClockShootingData> data;
  const ShotClockShootingBarChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ShotClockShootingData, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (ShotClockShootingData series, _) => series.frequency,
          measureFn: (ShotClockShootingData series, _) => series.percent,
          colorFn: (ShotClockShootingData series, _) => series.color)
    ];

    //return charts.BarChart(series, animate: true);

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Yearly Growth in the Flutter Community",
                //style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShotClockShootingData {
  var frequency;
  var percent;
  var color = charts.ColorUtil.fromDartColor(Colors.red);

  ShotClockShootingData(this.frequency, this.percent, this.color);
}

class ShotClockShootingDataList {
  List<ShotClockShootingData> items = [];

  ShotClockShootingDataList(dynamic json) {
    for (var s in json) {
      //items.add(ShotClockShootingData(s["resultSets"][2]["rowSet"], percent, color))
    }
  }
}
