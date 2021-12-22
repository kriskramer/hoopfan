import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsLastNGamesBaseCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsLastNGamesBaseCharts(this.data, this.statName);

  @override
  _TeamStatsLastNGamesBaseChartsState createState() =>
      _TeamStatsLastNGamesBaseChartsState();
}

class _TeamStatsLastNGamesBaseChartsState
    extends State<TeamStatsLastNGamesBaseCharts> {
  @override
  Widget build(BuildContext context) {
    LastNGamesSeriesBaseList list =
        LastNGamesSeriesBaseList(widget.data["resultSets"]);

    List<charts.Series<LastNGamesSeriesBase, String>> seriesFga = [
      charts.Series(
          id: "FGA",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fga,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesFgm = [
      charts.Series(
          id: "FGM",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fgm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesFgPct = [
      charts.Series(
          id: "FG%",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fgPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> series3Pa = [
      charts.Series(
          id: "FG3A",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fg3a,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> series3Pm = [
      charts.Series(
          id: "FG3M",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fg3m,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> series3PPct = [
      charts.Series(
          id: "3P%",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fg3Pct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesFta = [
      charts.Series(
          id: "FTA",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.fta,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesFtm = [
      charts.Series(
          id: "FTM",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.ftm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesFtPct = [
      charts.Series(
          id: "FT%",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.ftPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesOReb = [
      charts.Series(
          id: "OREB",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.oReb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesDReb = [
      charts.Series(
          id: "DREB",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.dReb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesReb = [
      charts.Series(
          id: "REB",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.reb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesAst = [
      charts.Series(
          id: "AST",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.ast,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesTov = [
      charts.Series(
          id: "TOV",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.tov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesStl = [
      charts.Series(
          id: "STL",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.stl,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesBlk = [
      charts.Series(
          id: "BLK",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.blk,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesBlkA = [
      charts.Series(
          id: "BLKA",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.blkA,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesPf = [
      charts.Series(
          id: "PF",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.pf,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesPfd = [
      charts.Series(
          id: "PFD",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.pfd,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesPts = [
      charts.Series(
          id: "PTS",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.pts,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<LastNGamesSeriesBase, String>> seriesPlusMinus = [
      charts.Series(
          id: "+/-",
          data: list.items,
          domainFn: (LastNGamesSeriesBase series, _) => series.typeValue,
          measureFn: (LastNGamesSeriesBase series, _) => series.plusMinus,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (LastNGamesSeriesBase series, _) => '${series.game}',
          colorFn: (LastNGamesSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    Widget chart;

    if (widget.statName == "FGM") {
      chart = getChart("Field Goals Made", seriesFgm);
    } else if (widget.statName == "FGA") {
      chart = getChart("Field Goals Attempted", seriesFga);
    } else if (widget.statName == "FG %") {
      chart = getChart("Field Goal Percent", seriesFgPct);
    } else if (widget.statName == "3PM") {
      chart = getChart("3 Pointers Made", series3Pm);
    } else if (widget.statName == "3PA") {
      chart = getChart("3 Pointers Attempted", series3Pa);
    } else if (widget.statName == "3P %") {
      chart = getChart("3 Point Percent", series3PPct);
    } else if (widget.statName == "FTM") {
      chart = getChart("Free Throws Made", seriesFtm);
    } else if (widget.statName == "FTA") {
      chart = getChart("Free Throws Attempted", seriesFta);
    } else if (widget.statName == "FT %") {
      chart = getChart("Free Throw Percent", seriesFtPct);
    } else if (widget.statName == "OREB") {
      chart = getChart("Offensive Rebounds", seriesOReb);
    } else if (widget.statName == "DREB") {
      chart = getChart("Defensive Rebounds", seriesDReb);
    } else if (widget.statName == "REB") {
      chart = getChart("Total Rebounds", seriesReb);
    } else if (widget.statName == "AST") {
      chart = getChart("Assists", seriesAst);
    } else if (widget.statName == "TOV") {
      chart = getChart("Turnovers", seriesTov);
    } else if (widget.statName == "STL") {
      chart = getChart("Steals", seriesStl);
    } else if (widget.statName == "BLK") {
      chart = getChart("Blocks", seriesBlk);
    } else if (widget.statName == "BLKA") {
      chart = getChart("Blocks Against", seriesBlkA);
    } else if (widget.statName == "PF") {
      chart = getChart("Personal Fouls", seriesPf);
    } else if (widget.statName == "PFD") {
      chart = getChart("Personal Fouls Drawn", seriesPfd);
    } else if (widget.statName == "PTS") {
      chart = getChart("Points", seriesPts);
    } else if (widget.statName == "+/-") {
      chart = getChart("Plus/Minus", seriesPlusMinus);
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
      List<charts.Series<LastNGamesSeriesBase, String>> seriesName) {
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

class LastNGamesSeriesBase {
  var type;
  var typeValue;
  var fgm;
  var fga;
  var fgPct;
  var fg3m;
  var fg3a;
  var fg3Pct;
  var ftm;
  var fta;
  var ftPct;
  var oReb;
  var dReb;
  var reb;
  var ast;
  var tov;
  var stl;
  var blk;
  var blkA;
  var pf;
  var pfd;
  var pts;
  var plusMinus;

  LastNGamesSeriesBase(dynamic json) {
    type = json[0];
    typeValue = json[1];
    fgm = getDoubleFromJson(json[7]);
    fga = getDoubleFromJson(json[8]);
    fgPct = getPercentFromJson(json[9]);
    fg3m = getDoubleFromJson(json[10]);
    fg3a = getDoubleFromJson(json[11]);
    fg3Pct = getPercentFromJson(json[12]);
    ftm = getDoubleFromJson(json[13]);
    fta = getDoubleFromJson(json[14]);
    ftPct = getPercentFromJson(json[15]);
    oReb = getDoubleFromJson(json[16]);
    dReb = getDoubleFromJson(json[17]);
    reb = getDoubleFromJson(json[18]);
    ast = getDoubleFromJson(json[19]);
    tov = getDoubleFromJson(json[20]);
    stl = getDoubleFromJson(json[21]);
    blk = getDoubleFromJson(json[22]);
    blkA = getDoubleFromJson(json[23]);
    pf = getDoubleFromJson(json[24]);
    pfd = getDoubleFromJson(json[25]);
    pts = getDoubleFromJson(json[26]);
    plusMinus = getDoubleFromJson(json[27]);
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

  double getPercentFromJson(var value) {
    String s = value.toString();
    double d = double.tryParse(s);

    if (d == null) {
      return 0.0;
    } else {
      return d * 100;
    }
  }
}

class LastNGamesSeriesBaseList {
  List<LastNGamesSeriesBase> items = [];

  LastNGamesSeriesBaseList(dynamic json) {
    for (var r in json) {
      for (var s in r["rowSet"]) {
        items.add(LastNGamesSeriesBase(s));
      }
    }
  }
}
