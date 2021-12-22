import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsLastNGamesScoringCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsLastNGamesScoringCharts(this.data, this.statName);

  @override
  _TeamStatsLastNGamesScoringChartsState createState() =>
      _TeamStatsLastNGamesScoringChartsState();
}

class _TeamStatsLastNGamesScoringChartsState
    extends State<TeamStatsLastNGamesScoringCharts> {
  @override
  Widget build(BuildContext context) {
    LastNGamesSeriesScoringList list =
        LastNGamesSeriesScoringList(widget.data["resultSets"]);

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctFga2pt = [
      charts.Series(
          id: "% Fga 2pt",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctFga2pt,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctFga3pt = [
      charts.Series(
          id: "% Fga 3p",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctFga3pt,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPts2p = [
      charts.Series(
          id: "% Pts 2p",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPts2p,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPts2pMr = [
      charts.Series(
          id: "% Pts 2P Mr",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPts2pMr,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPts3p = [
      charts.Series(
          id: "% Pts 3P",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPts3p,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPtsFb = [
      charts.Series(
          id: "% Pts FB",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPtsFb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPtsFt = [
      charts.Series(
          id: "% Pts FT",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPtsFt,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPtsOffTov = [
      charts.Series(
          id: "% Pts Off Tov",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPtsOffTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctPtsPaint = [
      charts.Series(
          id: "% Pts Paint",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctPtsPaint,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctAst2pm = [
      charts.Series(
          id: "% Ast 2pm",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctAst2pm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctUAst2pm = [
      charts.Series(
          id: "% UAst 2pm",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctUAst2pm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctAst3pm = [
      charts.Series(
          id: "% Ast 3pm",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctAst3pm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctUAst3pm = [
      charts.Series(
          id: "% UAst 3pm",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctUAst3pm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctAstFgm = [
      charts.Series(
          id: "% Ast Fgm",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctAstFgm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesScoring, String>> seriesPctUAstFgm = [
      charts.Series(
          id: "% UAst Fgm",
          data: list.items,
          domainFn: (LastNGamesSeriesScoring series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesScoring series, _) => series.pctUAstFgm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesScoring series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesScoring series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    Widget chart;

    if (widget.statName == "PCT_FGA_2P") {
      chart = getChart("% Field Goals Attempted - 2P", seriesPctFga2pt);
    } else if (widget.statName == "PCT_FGA_3P") {
      chart = getChart("% Field Goals Attempted - 3P", seriesPctFga3pt);
    } else if (widget.statName == "PCT_PTS_2P") {
      chart = getChart("% Points - 2P", seriesPctPts2p);
    } else if (widget.statName == "PCT_PTS_2P_MR") {
      chart = getChart("% Points - 2P MR", seriesPctPts2pMr);
    } else if (widget.statName == "PCT_PTS_3P") {
      chart = getChart("% Points - 3P", seriesPctPts3p);
    } else if (widget.statName == "PCT_PTS_FB") {
      chart = getChart("% Points - Fast Break", seriesPctPtsFb);
    } else if (widget.statName == "PCT_PTS_FT") {
      chart = getChart("% Points - Free Throws", seriesPctPtsFt);
    } else if (widget.statName == "PCT_PTS_OFF_TOV") {
      chart = getChart("% Points Off Turnovers", seriesPctPtsOffTov);
    } else if (widget.statName == "PCT_PTS_PAINT") {
      chart = getChart("% Points in the Paint", seriesPctPtsPaint);
    } else if (widget.statName == "PCT_AST_2PM") {
      chart = getChart("% Assisted 2P Made", seriesPctAst2pm);
    } else if (widget.statName == "PCT_UAST_2PM") {
      chart = getChart("% Unassisted 2P Made", seriesPctUAst2pm);
    } else if (widget.statName == "PCT_AST_3PM") {
      chart = getChart("% Assisted 3P Made", seriesPctAst3pm);
    } else if (widget.statName == "PCT_UAST_3PM") {
      chart = getChart("% Unassisted 3P Made", seriesPctUAst3pm);
    } else if (widget.statName == "PCT_AST_FGM") {
      chart = getChart("% Assisted Field Goals Made", seriesPctAstFgm);
    } else if (widget.statName == "PCT_UAST_FGM") {
      chart = getChart("% Unassisted Field Goals Made", seriesPctUAstFgm);
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
      List<charts.Series<LastNGamesSeriesScoring, String>> seriesName) {
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

class LastNGamesSeriesScoring {
  var type;
  var typeValue;
  var pctFga2pt;
  var pctFga3pt;
  var pctPts2p;
  var pctPts2pMr;
  var pctPts3p;
  var pctPtsFb;
  var pctPtsFt;
  var pctPtsOffTov;
  var pctPtsPaint;
  var pctAst2pm;
  var pctUAst2pm;
  var pctAst3pm;
  var pctUAst3pm;
  var pctAstFgm;
  var pctUAstFgm;

  LastNGamesSeriesScoring(dynamic json) {
    type = json[0];
    typeValue = json[1];
    pctFga2pt = getDoubleFromJson(json[7]);
    pctFga3pt = getDoubleFromJson(json[8]);
    pctPts2p = getDoubleFromJson(json[9]);
    pctPts2pMr = getDoubleFromJson(json[10]);
    pctPts3p = getDoubleFromJson(json[11]);
    pctPtsFb = getDoubleFromJson(json[12]);
    pctPtsFt = getDoubleFromJson(json[13]);
    pctPtsOffTov = getDoubleFromJson(json[14]);
    pctPtsPaint = getDoubleFromJson(json[15]);
    pctAst2pm = getDoubleFromJson(json[16]);
    pctUAst2pm = getDoubleFromJson(json[17]);
    pctAst3pm = getDoubleFromJson(json[18]);
    pctUAst3pm = getDoubleFromJson(json[19]);
    pctAstFgm = getDoubleFromJson(json[20]);
    pctUAstFgm = getDoubleFromJson(json[21]);
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

class LastNGamesSeriesScoringList {
  List<LastNGamesSeriesScoring> items = [];

  LastNGamesSeriesScoringList(dynamic json) {
    for (var r in json) {
      for (var s in r["rowSet"]) {
        items.add(LastNGamesSeriesScoring(s));
      }
    }
  }
}
