import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsLastNGamesMiscCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsLastNGamesMiscCharts(this.data, this.statName);

  @override
  _TeamStatsLastNGamesMiscChartsState createState() =>
      _TeamStatsLastNGamesMiscChartsState();
}

class _TeamStatsLastNGamesMiscChartsState
    extends State<TeamStatsLastNGamesMiscCharts> {
  @override
  Widget build(BuildContext context) {
    LastNGamesSeriesMiscList list =
        LastNGamesSeriesMiscList(widget.data["resultSets"]);

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesPtsOffTov = [
      charts.Series(
          id: "Pts Off Tov",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.ptsOffTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesPts2ndChance = [
      charts.Series(
          id: "Pts 2nd Chance",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.pts2ndChance,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesPtsFB = [
      charts.Series(
          id: "Pts FB",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.ptsFb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesPtsPaint = [
      charts.Series(
          id: "Pts Paint",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.ptsPaint,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesOppPtsTov = [
      charts.Series(
          id: "Opp Pts Tov",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.oppPtsOffTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesOppPts2ndChance = [
      charts.Series(
          id: "Opp Pts 2nd Chance",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.oppPts2ndChance,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesOppPtsFb = [
      charts.Series(
          id: "Opp Pts FB",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.oppPtsFb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesMisc, String>> seriesOppPtsPaint = [
      charts.Series(
          id: "Opp Pts Paint",
          data: list.items,
          domainFn: (LastNGamesSeriesMisc series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesMisc series, _) => series.oppPtsPaint,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesMisc series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    Widget chart;

    if (widget.statName == "PtsOffTov") {
      chart = getChart("Points off Turnovers", seriesPtsOffTov);
    } else if (widget.statName == "Pts2ndChance") {
      chart = getChart("2nd Chance Points", seriesPts2ndChance);
    } else if (widget.statName == "PtsFB") {
      chart = getChart("Fast Break Points", seriesPtsFB);
    } else if (widget.statName == "PtsPaint") {
      chart = getChart("Points in the Paint", seriesPtsPaint);
    } else if (widget.statName == "OppPtsOffTov") {
      chart = getChart("Opponent Points off Turnovers", seriesOppPtsTov);
    } else if (widget.statName == "OppPts2ndChance") {
      chart = getChart("Opponent 2nd Chance Points", seriesOppPts2ndChance);
    } else if (widget.statName == "OppPtsFB") {
      chart = getChart("Opponent Fast Break Points", seriesOppPtsFb);
    } else if (widget.statName == "OppPtsPaint") {
      chart = getChart("Opponent Points in the Paint", seriesOppPtsPaint);
    }

    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        content: Container(
          padding: EdgeInsets.all(5),
          child: Card(
            child: Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              chart,
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }

  Widget getChart(String title,
      List<charts.Series<LastNGamesSeriesMisc, String>> seriesName) {
    return Container(
      height: 500,
      child: Column(children: [
        Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        Divider(),
        Expanded(
          child: charts.BarChart(
            seriesName,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            behaviors: [new charts.SeriesLegend()],
            vertical: false,
          ),
        )
      ]),
    );
  }
}

class LastNGamesSeriesMisc {
  var type;
  var typeValue;
  var ptsOffTov;
  var pts2ndChance;
  var ptsFb;
  var ptsPaint;
  var oppPtsOffTov;
  var oppPts2ndChance;
  var oppPtsFb;
  var oppPtsPaint;

  LastNGamesSeriesMisc(dynamic json) {
    type = json[0];
    typeValue = json[1];
    ptsOffTov = getDoubleFromJson(json[7]);
    pts2ndChance = getDoubleFromJson(json[8]);
    ptsFb = getDoubleFromJson(json[9]);
    ptsPaint = getDoubleFromJson(json[10]);
    oppPtsOffTov = getDoubleFromJson(json[11]);
    oppPts2ndChance = getDoubleFromJson(json[12]);
    oppPtsFb = getDoubleFromJson(json[13]);
    oppPtsPaint = getDoubleFromJson(json[14]);
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

class LastNGamesSeriesMiscList {
  List<LastNGamesSeriesMisc> items = [];

  LastNGamesSeriesMiscList(dynamic json) {
    for (var r in json) {
      for (var s in r["rowSet"]) {
        items.add(LastNGamesSeriesMisc(s));
      }
    }
  }
}
