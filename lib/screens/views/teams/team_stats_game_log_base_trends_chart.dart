import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TeamStatsGameLogBaseCharts extends StatefulWidget {
  final dynamic data;
  final String statName;
  const TeamStatsGameLogBaseCharts(this.data, this.statName);

  @override
  _TeamStatsGameLogBaseChartsState createState() =>
      _TeamStatsGameLogBaseChartsState();
}

class _TeamStatsGameLogBaseChartsState
    extends State<TeamStatsGameLogBaseCharts> {
  @override
  Widget build(BuildContext context) {
    GameLogSeriesBaseList list =
        GameLogSeriesBaseList(widget.data["resultSets"][0]["rowSet"]);

    List<charts.Series<GameLogSeriesBase, String>> seriesFga = [
      charts.Series(
          id: "FGA",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fga,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesFgm = [
      charts.Series(
          id: "FGM",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fgm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesFgPct = [
      charts.Series(
          id: "FG%",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fgPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> series3Pa = [
      charts.Series(
          id: "FG3A",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fg3a,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> series3Pm = [
      charts.Series(
          id: "FG3M",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fg3m,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> series3PPct = [
      charts.Series(
          id: "3P%",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fg3Pct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesFta = [
      charts.Series(
          id: "FTA",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.fta,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesFtm = [
      charts.Series(
          id: "FTM",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.ftm,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesFtPct = [
      charts.Series(
          id: "FT%",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.ftPct,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesOReb = [
      charts.Series(
          id: "OREB",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.oReb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesDReb = [
      charts.Series(
          id: "DREB",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.dReb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesReb = [
      charts.Series(
          id: "REB",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.reb,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesAst = [
      charts.Series(
          id: "AST",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.ast,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesTov = [
      charts.Series(
          id: "TOV",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.tov,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesStl = [
      charts.Series(
          id: "STL",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.stl,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesBlk = [
      charts.Series(
          id: "BLK",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.blk,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesBlkA = [
      charts.Series(
          id: "BLKA",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.blkA,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPf = [
      charts.Series(
          id: "PF",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.pf,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPfd = [
      charts.Series(
          id: "PFD",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.pfd,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPts = [
      charts.Series(
          id: "PTS",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.pts,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    List<charts.Series<GameLogSeriesBase, String>> seriesPlusMinus = [
      charts.Series(
          id: "+/-",
          data: list.items,
          domainFn: (GameLogSeriesBase series, _) => series.date,
          measureFn: (GameLogSeriesBase series, _) => series.plusMinus,
          // Set a label accessor to control the text of the arc label.
          //labelAccessorFn: (GameLogSeriesBase series, _) => '${series.game}',
          colorFn: (GameLogSeriesBase series, _) =>
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

  Widget getChart(
      String title, List<charts.Series<GameLogSeriesBase, String>> seriesName) {
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

class GameLogSeriesBase {
  var date;
  var game;
  var wl;
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

  GameLogSeriesBase(dynamic json) {
    date = json[5]
        .replaceAll("T00:00:00", "")
        .replaceAll("2021-", "")
        .replaceAll("2022-", "");
    game = json[6];
    wl = json[7];
    fgm = getDoubleFromJson(json[9]);
    fga = getDoubleFromJson(json[10]);
    fgPct = getDoubleFromJson(json[11]);
    fg3m = getDoubleFromJson(json[12]);
    fg3a = getDoubleFromJson(json[13]);
    fg3Pct = getDoubleFromJson(json[14]);
    ftm = getDoubleFromJson(json[15]);
    fta = getDoubleFromJson(json[16]);
    ftPct = getDoubleFromJson(json[17]);
    oReb = getDoubleFromJson(json[18]);
    dReb = getDoubleFromJson(json[19]);
    reb = getDoubleFromJson(json[20]);
    ast = getDoubleFromJson(json[21]);
    tov = getDoubleFromJson(json[22]);
    stl = getDoubleFromJson(json[23]);
    blk = getDoubleFromJson(json[24]);
    blkA = getDoubleFromJson(json[25]);
    pf = getDoubleFromJson(json[26]);
    pfd = getDoubleFromJson(json[27]);
    pts = getDoubleFromJson(json[28]);
    plusMinus = getDoubleFromJson(json[29]);
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
