import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsGameLogFourFactorsCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsGameLogFourFactorsCharts(this.data, this.statName);

  @override
  _TeamStatsGameLogFourFactorsChartsState createState() =>
      _TeamStatsGameLogFourFactorsChartsState();
}

class _TeamStatsGameLogFourFactorsChartsState
    extends State<TeamStatsGameLogFourFactorsCharts> {
  @override
  Widget build(BuildContext context) {
    GameLogSeriesFourFactorsList list =
        GameLogSeriesFourFactorsList(widget.data["resultSets"][0]["rowSet"]);

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesEFG = [
      charts.Series(
          id: "eFG %",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.eFG,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesFtaRate = [
      charts.Series(
          id: "FTA Rate",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.ftaRate,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesTmTovPct = [
      charts.Series(
          id: "Tm Tov %",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.tmTovPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesORebPct = [
      charts.Series(
          id: "OReb %",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.oRebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesOppEFG = [
      charts.Series(
          id: "Opp eFG %",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.oppEFG,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesOppFtaRate = [
      charts.Series(
          id: "Opp FTA Rate",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.oppFtaRate,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesOppTmTovPct = [
      charts.Series(
          id: "Opp Tm Tov %",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.oppTmTovPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesFourFactors, String>> seriesOppORebPct = [
      charts.Series(
          id: "Opp OReb %",
          data: list.items,
          domainFn: (GameLogSeriesFourFactors series, _) => series.date,
          measureFn: (GameLogSeriesFourFactors series, _) => series.oppORebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesFourFactors series, _) => '${series.game}',
          colorFn: (GameLogSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    Widget chart;

    if (widget.statName == "eFG") {
      chart = getChart("Effective FG %", seriesEFG);
    } else if (widget.statName == "FtaRate") {
      chart = getChart("Free Throw Attempts Rate", seriesFtaRate);
    } else if (widget.statName == "TmTovPct") {
      chart = getChart("Team Turnover %", seriesTmTovPct);
    } else if (widget.statName == "ORebPct") {
      chart = getChart("Offensive Rebounding %", seriesORebPct);
    } else if (widget.statName == "OppEFG") {
      chart = getChart("Opponent Effective FG %", seriesOppEFG);
    } else if (widget.statName == "OppFtaRate") {
      chart = getChart("Opponent Free Throw Attempts Rate", seriesOppFtaRate);
    } else if (widget.statName == "OppTmTovPct") {
      chart = getChart("Opponent Team Turnover %", seriesOppTmTovPct);
    } else if (widget.statName == "OppORebPct") {
      chart = getChart("Opponent Offensive Rebounding %", seriesOppORebPct);
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
      List<charts.Series<GameLogSeriesFourFactors, String>> seriesName) {
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

class GameLogSeriesFourFactors {
  var date;
  var game;
  var wl;
  var eFG;
  var ftaRate;
  var tmTovPct;
  var oRebPct;
  var oppEFG;
  var oppFtaRate;
  var oppTmTovPct;
  var oppORebPct;

  GameLogSeriesFourFactors(dynamic json) {
    date = json[5]
        .replaceAll("T00:00:00", "")
        .replaceAll("2021-", "")
        .replaceAll("2022-", "");
    game = json[6];
    wl = json[7];
    eFG = getDoubleFromJson(json[9]);
    ftaRate = getDoubleFromJson(json[10]);
    tmTovPct = getDoubleFromJson(json[11]);
    oRebPct = getDoubleFromJson(json[12]);
    oppEFG = getDoubleFromJson(json[13]);
    oppFtaRate = getDoubleFromJson(json[14]);
    oppTmTovPct = getDoubleFromJson(json[15]);
    oppORebPct = getDoubleFromJson(json[16]);
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

class GameLogSeriesFourFactorsList {
  List<GameLogSeriesFourFactors> items = [];

  GameLogSeriesFourFactorsList(dynamic json) {
    for (var s in json) {
      items.add(GameLogSeriesFourFactors(s));
    }
  }
}
