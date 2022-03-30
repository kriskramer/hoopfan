import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsGameLogAdvancedCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsGameLogAdvancedCharts(this.data, this.statName);

  @override
  _TeamStatsGameLogAdvancedChartsState createState() =>
      _TeamStatsGameLogAdvancedChartsState();
}

class _TeamStatsGameLogAdvancedChartsState
    extends State<TeamStatsGameLogAdvancedCharts> {
  @override
  Widget build(BuildContext context) {
    GameLogSeriesBaseList list =
        GameLogSeriesBaseList(widget.data["resultSets"][0]["rowSet"]);

    List<charts.Series<GameLogSeriesBase, String>> seriesORtg = [
      charts.Series(
          id: "ORtg",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.ortg,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesDRtg = [
      charts.Series(
          id: "DRtg",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.drtg,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesNet = [
      charts.Series(
          id: "Net",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.net,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesAstPct = [
      charts.Series(
          id: "Ast %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.astPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesAstTov = [
      charts.Series(
          id: "Ast/Tov",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.astTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesAstRatio = [
      charts.Series(
          id: "Ast Rto",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.astRatio,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesORebPct = [
      charts.Series(
          id: "OReb %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.oRebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesDRebPct = [
      charts.Series(
          id: "DReb %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.dRebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesRebPct = [
      charts.Series(
          id: "Reb %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.rebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesTmTovPct = [
      charts.Series(
          id: "Tm Tov %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.tmTovPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesEfgPct = [
      charts.Series(
          id: "eFG %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.eFgPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesTsPct = [
      charts.Series(
          id: "TS %",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.tsPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPace = [
      charts.Series(
          id: "Pace",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.pace,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPace40 = [
      charts.Series(
          id: "Pace/40",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.pace40,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPoss = [
      charts.Series(
          id: "Poss",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.poss,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPie = [
      charts.Series(
          id: "Pie",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.pie,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    Widget chart;

    if (widget.statName == "ORtg") {
      chart = getChart("Offensive Rating", seriesORtg);
    } else if (widget.statName == "DRtg") {
      chart = getChart("Defensive Rating", seriesDRtg);
    } else if (widget.statName == "Net") {
      chart = getChart("Net Rating", seriesNet);
    } else if (widget.statName == "Ast %") {
      chart = getChart("Assist %", seriesAstPct);
    } else if (widget.statName == "AstTov") {
      chart = getChart("Assist / Turnovers", seriesAstTov);
    } else if (widget.statName == "Ast Rto") {
      chart = getChart("Assist Ratio", seriesAstRatio);
    } else if (widget.statName == "OReb %") {
      chart = getChart("Offensive Rebound %", seriesORebPct);
    } else if (widget.statName == "DReb %") {
      chart = getChart("Defensive Rebound %", seriesDRebPct);
    } else if (widget.statName == "Reb %") {
      chart = getChart("Rebound %", seriesRebPct);
    } else if (widget.statName == "TmTov %") {
      chart = getChart("Team Turnover %", seriesTmTovPct);
    } else if (widget.statName == "eFG %") {
      chart = getChart("Effective Field Goal %", seriesEfgPct);
    } else if (widget.statName == "TS %") {
      chart = getChart("True Shooting %", seriesTsPct);
    } else if (widget.statName == "Pace") {
      chart = getChart("Pace", seriesPace);
    } else if (widget.statName == "Pace/40") {
      chart = getChart("Pace / 40", seriesPace40);
    } else if (widget.statName == "Poss") {
      chart = getChart("Possessions", seriesPoss);
    } else if (widget.statName == "PIE") {
      chart = getChart("PIE", seriesPie);
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
      String title, List<charts.Series<GameLogSeriesBase, String>> seriesName) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width - 40,
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

class GameLogSeriesBase {
  var date;
  var game;
  var wl;
  var ortg;
  var drtg;
  var net;
  var astPct;
  var astTov;
  var astRatio;
  var oRebPct;
  var dRebPct;
  var rebPct;
  var tmTovPct;
  var eFgPct;
  var tsPct;
  var pace;
  var pace40;
  var poss;
  var pie;

  GameLogSeriesBase(dynamic json) {
    date = json[5]
        .replaceAll("T00:00:00", "")
        .replaceAll("2021-", "")
        .replaceAll("2022-", "");
    game = json[6];
    wl = json[7];
    ortg = getDoubleFromJson(json[10]);
    drtg = getDoubleFromJson(json[12]);
    net = getDoubleFromJson(json[14]);
    astPct = getDoubleFromJson(json[15]);
    astTov = getDoubleFromJson(json[16]);
    astRatio = getDoubleFromJson(json[17]);
    oRebPct = getDoubleFromJson(json[18]);
    dRebPct = getDoubleFromJson(json[19]);
    rebPct = getDoubleFromJson(json[20]);
    tmTovPct = getDoubleFromJson(json[21]);
    eFgPct = getDoubleFromJson(json[22]);
    tsPct = getDoubleFromJson(json[23]);
    pace = getDoubleFromJson(json[25]);
    pace40 = getDoubleFromJson(json[26]);
    poss = getDoubleFromJson(json[27]);
    pie = getDoubleFromJson(json[28]);
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

class GameLogSeriesBaseList {
  List<GameLogSeriesBase> items = [];

  GameLogSeriesBaseList(dynamic json) {
    for (var s in json) {
      items.add(GameLogSeriesBase(s));
    }
  }
}
