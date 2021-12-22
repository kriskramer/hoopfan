import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsLastNGamesAdvancedCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsLastNGamesAdvancedCharts(this.data, this.statName);

  @override
  _TeamStatsLastNGamesAdvancedChartsState createState() =>
      _TeamStatsLastNGamesAdvancedChartsState();
}

class _TeamStatsLastNGamesAdvancedChartsState
    extends State<TeamStatsLastNGamesAdvancedCharts> {
  @override
  Widget build(BuildContext context) {
    GameLogSeriesAdvancedList list =
        GameLogSeriesAdvancedList(widget.data["resultSets"]);

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesORtg = [
      charts.Series(
          id: "ORtg",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.ortg,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesDRtg = [
      charts.Series(
          id: "DRtg",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.drtg,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesNet = [
      charts.Series(
          id: "Net",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.net,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesAstPct = [
      charts.Series(
          id: "Ast %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.astPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesAstTov = [
      charts.Series(
          id: "Ast/Tov",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.astTov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesAstRatio = [
      charts.Series(
          id: "Ast Rto",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.astRatio,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesORebPct = [
      charts.Series(
          id: "OReb %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.oRebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesDRebPct = [
      charts.Series(
          id: "DReb %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.dRebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesRebPct = [
      charts.Series(
          id: "Reb %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.rebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesTmTovPct = [
      charts.Series(
          id: "Tm Tov %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.tmTovPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesEfgPct = [
      charts.Series(
          id: "eFG %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.eFgPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesTsPct = [
      charts.Series(
          id: "TS %",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.tsPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesPace = [
      charts.Series(
          id: "Pace",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.pace,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesPace40 = [
      charts.Series(
          id: "Pace/40",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.pace40,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesPoss = [
      charts.Series(
          id: "Poss",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.poss,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesAdvanced, String>> seriesPie = [
      charts.Series(
          id: "Pie",
          data: list.items,
          domainFn: (GameLogSeriesAdvanced series, _) => series.typeValue,
          measureFn: (GameLogSeriesAdvanced series, _) => series.pie,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesAdvanced series, _) => '${series.game}',
          colorFn: (GameLogSeriesAdvanced series, _) =>
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

  Widget getChart(String title,
      List<charts.Series<GameLogSeriesAdvanced, String>> seriesName) {
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

class GameLogSeriesAdvanced {
  var type;
  var typeValue;
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

  GameLogSeriesAdvanced(dynamic json) {
    type = json[0];
    typeValue = json[1];
    ortg = getDoubleFromJson(json[8]);
    drtg = getDoubleFromJson(json[10]);
    net = getDoubleFromJson(json[12]);
    astPct = getDoubleFromJson(json[13]);
    astTov = getDoubleFromJson(json[14]);
    astRatio = getDoubleFromJson(json[15]);
    oRebPct = getDoubleFromJson(json[16]);
    dRebPct = getDoubleFromJson(json[17]);
    rebPct = getDoubleFromJson(json[18]);
    tmTovPct = getDoubleFromJson(json[19]);
    eFgPct = getDoubleFromJson(json[20]);
    tsPct = getDoubleFromJson(json[21]);
    pace = getDoubleFromJson(json[23]);
    pace40 = getDoubleFromJson(json[24]);
    poss = getDoubleFromJson(json[25]);
    pie = getDoubleFromJson(json[26]);
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

class GameLogSeriesAdvancedList {
  List<GameLogSeriesAdvanced> items = [];

  GameLogSeriesAdvancedList(dynamic json) {
    for (var r in json) {
      for (var s in r["rowSet"]) {
        items.add(GameLogSeriesAdvanced(s));
      }
    }
  }
}
