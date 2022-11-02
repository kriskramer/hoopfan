import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/four_factors_stats_league.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class LeagueStatsFourFactorsGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsFourFactorsGrid(this.stats);

  @override
  _LeagueStatsFourFactorsGridState createState() =>
      _LeagueStatsFourFactorsGridState();
}

class _LeagueStatsFourFactorsGridState
    extends State<LeagueStatsFourFactorsGrid> {
  bool sort = true;
  int colIndex = 0;
  int selectedTeamId = 0;

  @override
  Widget build(BuildContext context) {
    FourFactorsStatsLeagueList ffStats =
        FourFactorsStatsLeagueList(widget.stats);

    doSort(ffStats);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getFourFactorDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableFourFactorRows(ffStats),
        ],
      ),
    );
  }

  List<DataRow> getVariableFourFactorRows(FourFactorsStatsLeagueList stats) {
    List<DataRow> list = [];
    int counter = 1;
    for (var i in stats.items) {
      list.add(getFourFactorDataRow(i, counter));
      counter++;
    }
    return list;
  }

  DataRow getFourFactorDataRow(FourFactorsStatsLeague item, int index) {
    return DataRow(
        color: MaterialStateColor.resolveWith((states) {
          if (item.TEAMID == selectedTeamId) {
            return Colors.blue[50];
          } else {
            return Colors.white;
          }
        }),
        cells: [
          DataCell(Text(index.toString())),
          DataCell(GestureDetector(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return TeamDetails(nbaTeamId: item.TEAMID.toString());
                    });
              },
              onTap: () {
                setState(() {
                  selectedTeamId = item.TEAMID;
                });
              },
              child: Text(item.TEAM_NAME))),
          getDataCell(item.GP.toString(), item.GP_RANK, item),
          getDataCell(item.W.toString(), item.W_RANK, item),
          getDataCell(item.L.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN.toString(), item.MIN_RANK, item),
          getDataCell(item.eFgPct.toString(), item.eFgPct_RANK, item),
          getDataCell(item.OPP_eFgPct.toString(), item.OPP_eFgPct_RANK, item),
          DataCell(VerticalDivider()),
          getDiffDataCell(item.eFgPct, item.OPP_eFgPct),
          DataCell(VerticalDivider()),
          getDataCell(item.FTA_RATE.toString(), item.FTA_RATE_RANK, item),
          getDataCell(
              item.OPP_FTA_RATE.toString(), item.OPP_FTA_RATE_RANK, item),
          DataCell(VerticalDivider()),
          getDiffDataCell(item.FTA_RATE, item.OPP_FTA_RATE),
          DataCell(VerticalDivider()),
          getDataCell(item.tmTovPct.toString(), item.tmTovPct_RANK, item),
          getDataCell(item.OPP_TOV_PCT.toString(), item.OPP_TOV_PCT_RANK, item),
          DataCell(VerticalDivider()),
          getDiffDataCell(item.tmTovPct, item.OPP_TOV_PCT),
          DataCell(VerticalDivider()),
          getDataCell(item.oRebPct.toString(), item.oRebPct_RANK, item),
          getDataCell(item.OPP_oRebPct.toString(), item.OPP_oRebPct_RANK, item),
          DataCell(VerticalDivider()),
          getDiffDataCell(item.oRebPct, item.OPP_oRebPct),
          DataCell(VerticalDivider()),
          getDataCell(item.GP_RANK.toString(), item.GP_RANK, item),
          getDataCell(item.W_RANK.toString(), item.W_RANK, item),
          getDataCell(item.L_RANK.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT_RANK.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN_RANK.toString(), item.MIN_RANK, item),
          getDataCell(item.eFgPct_RANK.toString(), item.eFgPct_RANK, item),
          getDataCell(item.FTA_RATE_RANK.toString(), item.FTA_RATE_RANK, item),
          getDataCell(item.tmTovPct_RANK.toString(), item.tmTovPct_RANK, item),
          getDataCell(item.oRebPct_RANK.toString(), item.oRebPct_RANK, item),
          getDataCell(
              item.OPP_eFgPct_RANK.toString(), item.OPP_eFgPct_RANK, item),
          getDataCell(
              item.OPP_FTA_RATE_RANK.toString(), item.OPP_FTA_RATE_RANK, item),
          getDataCell(
              item.OPP_TOV_PCT_RANK.toString(), item.OPP_TOV_PCT_RANK, item),
          getDataCell(
              item.OPP_oRebPct_RANK.toString(), item.OPP_oRebPct_RANK, item),
        ]);
  }

  List<DataColumn> getFourFactorDataColumns() {
    List<DataColumn> list = [];
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('TEAM_NAME'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W'), onSort: sortFunction));
    list.add(DataColumn(label: Text('L'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('MIN'), onSort: sortFunction));
    list.add(DataColumn(label: Text('EFG %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP EFG %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('FTA RATE'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP FTA RATE'), onSort: sortFunction));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));

    list.add(DataColumn(label: Text('TM TOV %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP TOV %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));

    list.add(DataColumn(label: Text('OREB %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP OREB %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('GP RANK')));
    list.add(DataColumn(label: Text('W RANK')));
    list.add(DataColumn(label: Text('L RANK')));
    list.add(DataColumn(label: Text('W % RANK')));
    list.add(DataColumn(label: Text('MIN RANK')));
    list.add(DataColumn(label: Text('EFG % RANK')));
    list.add(DataColumn(label: Text('FTA RATE RANK')));
    list.add(DataColumn(label: Text('TM TOV % RANK')));
    list.add(DataColumn(label: Text('OREB % RANK')));
    list.add(DataColumn(label: Text('OPP EFG % RANK')));
    list.add(DataColumn(label: Text('OPP FTA RATE RANK')));
    list.add(DataColumn(label: Text('OPP TOV % RANK')));
    list.add(DataColumn(label: Text('OPP OREB % RANK')));

    return list;
  }

  DataCell getDiffDataCell(double value1, double value2) {
    double v3 = 0.0;
    v3 = value1 - value2;

    Widget c;

    v3 > 0
        ? c = Container(
            alignment: Alignment.center,
            width: 10,
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.green,
            ))
        : c = Container(
            alignment: Alignment.center,
            width: 10,
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.red,
            ));

    return DataCell(Row(children: [
      Text(v3.toStringAsFixed(2),
          style: TextStyle(fontWeight: FontWeight.w500)),
      c
    ]));
  }

  void doSort(FourFactorsStatsLeagueList stats) {
    if (colIndex == 1) {
      stats.sortTeam(sort);
    }
    if (colIndex == 2) {
      stats.sortGP(sort);
    }
    if (colIndex == 3) {
      stats.sortW(sort);
    }
    if (colIndex == 4) {
      stats.sortL(sort);
    }
    if (colIndex == 5) {
      stats.sortWPCT(sort);
    }
    if (colIndex == 6) {
      stats.sortMin(sort);
    }
    if (colIndex == 7) {
      stats.sortEFGPct(sort);
    }
    if (colIndex == 8) {
      stats.sortOppEFGPct(sort);
    }
    if (colIndex == 12) {
      stats.sortFTARate(sort);
    }
    if (colIndex == 13) {
      stats.sortOppFtaRate(sort);
    }
    if (colIndex == 17) {
      stats.sortTmTovPct(sort);
    }
    if (colIndex == 18) {
      stats.sortOppTovPct(sort);
    }
    if (colIndex == 22) {
      stats.sortORebPct(sort);
    }
    if (colIndex == 23) {
      stats.sortOppORebPct(sort);
    }
  }

  DataCell getDataCell(String value, int rank, FourFactorsStatsLeague item) {
    return DataCell(Text(value, style: rankColors(rank)), onTap: () {
      setState(() {
        selectedTeamId = item.TEAMID;
      });
    });
  }

  void sortFunction(int columnIndex, bool asc) {
    setState(() {
      sort = !sort;
      colIndex = columnIndex;
    });
  }

  TextStyle rankColors(int rank) {
    TextStyle ts;

    if (rank <= 5) {
      ts = TextStyle(color: Colors.purple[900]);
    } else if (rank <= 10) {
      ts = TextStyle(color: Colors.blue[800]);
    } else if (rank <= 15) {
      ts = TextStyle(color: Colors.green[700]);
    } else if (rank <= 20) {
      ts = TextStyle(color: Colors.yellow[800]);
    } else if (rank <= 25) {
      ts = TextStyle(color: Colors.orange[800]);
    } else if (rank <= 30) {
      ts = TextStyle(color: Colors.red[800]);
    }

    return ts;
  }
}
