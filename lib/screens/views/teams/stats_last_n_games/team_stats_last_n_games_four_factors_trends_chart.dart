import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsLastNGamesFourFactorsCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsLastNGamesFourFactorsCharts(this.data, this.statName);

  @override
  _TeamStatsLastNGamesFourFactorsChartsState createState() =>
      _TeamStatsLastNGamesFourFactorsChartsState();
}

class _TeamStatsLastNGamesFourFactorsChartsState
    extends State<TeamStatsLastNGamesFourFactorsCharts> {
  @override
  Widget build(BuildContext context) {
    LastNGamesSeriesFourFactorsList list =
        LastNGamesSeriesFourFactorsList(widget.data["resultSets"]);

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesEFG = [
      charts.Series(
          id: "eFG %",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) => series.eFG,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesFtaRate = [
      charts.Series(
          id: "FTA Rate",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) => series.ftaRate,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesTmTovPct = [
      charts.Series(
          id: "Tm Tov %",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) => series.tmTovPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesORebPct = [
      charts.Series(
          id: "OReb %",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) => series.oRebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesOppEFG = [
      charts.Series(
          id: "Opp eFG %",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) => series.oppEFG,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesOppFtaRate =
        [
      charts.Series(
          id: "Opp FTA Rate",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) =>
              series.oppFtaRate,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesOppTmTovPct =
        [
      charts.Series(
          id: "Opp Tm Tov %",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) =>
              series.oppTmTovPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesOppORebPct =
        [
      charts.Series(
          id: "Opp OReb %",
          data: list.items,
          domainFn: (LastNGamesSeriesFourFactors series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesFourFactors series, _) =>
              series.oppORebPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesFourFactors series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesFourFactors series, _) =>
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
      List<charts.Series<LastNGamesSeriesFourFactors, String>> seriesName) {
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

class LastNGamesSeriesFourFactors {
  var type;
  var typeValue;
  var eFG;
  var ftaRate;
  var tmTovPct;
  var oRebPct;
  var oppEFG;
  var oppFtaRate;
  var oppTmTovPct;
  var oppORebPct;

  LastNGamesSeriesFourFactors(dynamic json) {
    type = json[0];
    typeValue = json[1];
    eFG = getDoubleFromJson(json[7]);
    ftaRate = getDoubleFromJson(json[8]);
    tmTovPct = getDoubleFromJson(json[9]);
    oRebPct = getDoubleFromJson(json[10]);
    oppEFG = getDoubleFromJson(json[11]);
    oppFtaRate = getDoubleFromJson(json[12]);
    oppTmTovPct = getDoubleFromJson(json[13]);
    oppORebPct = getDoubleFromJson(json[14]);
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

class LastNGamesSeriesFourFactorsList {
  List<LastNGamesSeriesFourFactors> items = [];

  LastNGamesSeriesFourFactorsList(dynamic json) {
    for (var r in json) {
      for (var s in r["rowSet"]) {
        items.add(LastNGamesSeriesFourFactors(s));
      }
    }
  }
}
