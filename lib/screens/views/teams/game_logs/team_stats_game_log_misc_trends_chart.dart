import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsGameLogMiscCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsGameLogMiscCharts(this.data, this.statName);

  @override
  _TeamStatsGameLogMiscChartsState createState() =>
      _TeamStatsGameLogMiscChartsState();
}

class _TeamStatsGameLogMiscChartsState
    extends State<TeamStatsGameLogMiscCharts> {
  @override
  Widget build(BuildContext context) {
    GameLogSeriesMiscList list =
        GameLogSeriesMiscList(widget.data["resultSets"][0]["rowSet"]);

    List<charts.Series<GameLogSeriesMisc, String>> seriesPtsOffTov = [
      charts.Series(
          id: "Pts Off Tov",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.ptsOffTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesPts2ndChance = [
      charts.Series(
          id: "Pts 2nd Chance",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.pts2ndChance,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesPtsFB = [
      charts.Series(
          id: "Pts FB",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.ptsFb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesPtsPaint = [
      charts.Series(
          id: "Pts Paint",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.ptsPaint,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesOppPtsTov = [
      charts.Series(
          id: "Opp Pts Tov",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.oppPtsOffTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesOppPts2ndChance = [
      charts.Series(
          id: "Opp Pts 2nd Chance",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.oppPts2ndChance,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesOppPtsFb = [
      charts.Series(
          id: "Opp Pts FB",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.oppPtsFb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesMisc, String>> seriesOppPtsPaint = [
      charts.Series(
          id: "Opp Pts Paint",
          data: list.items,
          domainFn: (GameLogSeriesMisc series, _) => series.date,
          measureFn: (GameLogSeriesMisc series, _) => series.oppPtsPaint,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesMisc series, _) => '${series.game}',
          colorFn: (GameLogSeriesMisc series, _) =>
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

  Widget getChart(
      String title, List<charts.Series<GameLogSeriesMisc, String>> seriesName) {
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

class GameLogSeriesMisc {
  var date;
  var game;
  var wl;
  var ptsOffTov;
  var pts2ndChance;
  var ptsFb;
  var ptsPaint;
  var oppPtsOffTov;
  var oppPts2ndChance;
  var oppPtsFb;
  var oppPtsPaint;

  GameLogSeriesMisc(dynamic json) {
    date = json[5]
        .replaceAll("T00:00:00", "")
        .replaceAll("2021-", "")
        .replaceAll("2022-", "");
    game = json[6];
    wl = json[7];
    ptsOffTov = getDoubleFromJson(json[9]);
    pts2ndChance = getDoubleFromJson(json[10]);
    ptsFb = getDoubleFromJson(json[11]);
    ptsPaint = getDoubleFromJson(json[12]);
    oppPtsOffTov = getDoubleFromJson(json[13]);
    oppPts2ndChance = getDoubleFromJson(json[14]);
    oppPtsFb = getDoubleFromJson(json[15]);
    oppPtsPaint = getDoubleFromJson(json[16]);
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

class GameLogSeriesMiscList {
  List<GameLogSeriesMisc> items = [];

  GameLogSeriesMiscList(dynamic json) {
    for (var s in json) {
      items.add(GameLogSeriesMisc(s));
    }
  }
}
