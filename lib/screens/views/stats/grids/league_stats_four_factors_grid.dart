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
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamDetails(nbaTeamId: item.TEAM_ID.toString());
                });
          },
          child: Text(item.TEAM_NAME))),
      DataCell(Text(item.GP.toString())),
      DataCell(Text(item.W.toString())),
      DataCell(Text(item.L.toString())),
      DataCell(Text(item.W_PCT.toString())),
      DataCell(Text(item.MIN.toString())),
      DataCell(Text(item.EFG_PCT.toString())),
      DataCell(Text(item.OPP_EFG_PCT.toString())),
      DataCell(VerticalDivider()),
      getDiffDataCell(item.EFG_PCT, item.OPP_EFG_PCT),
      DataCell(VerticalDivider()),
      DataCell(Text(item.FTA_RATE.toString())),
      DataCell(Text(item.OPP_FTA_RATE.toString())),
      DataCell(VerticalDivider()),
      getDiffDataCell(item.FTA_RATE, item.OPP_FTA_RATE),
      DataCell(VerticalDivider()),
      DataCell(Text(item.TM_TOV_PCT.toString())),
      DataCell(Text(item.OPP_TOV_PCT.toString())),
      DataCell(VerticalDivider()),
      getDiffDataCell(item.TM_TOV_PCT, item.OPP_TOV_PCT),
      DataCell(VerticalDivider()),
      DataCell(Text(item.OREB_PCT.toString())),
      DataCell(Text(item.OPP_OREB_PCT.toString())),
      DataCell(VerticalDivider()),
      getDiffDataCell(item.OREB_PCT, item.OPP_OREB_PCT),
      DataCell(VerticalDivider()),
      DataCell(Text(item.GP_RANK.toString())),
      DataCell(Text(item.W_RANK.toString())),
      DataCell(Text(item.L_RANK.toString())),
      DataCell(Text(item.W_PCT_RANK.toString())),
      DataCell(Text(item.MIN_RANK.toString())),
      DataCell(Text(item.EFG_PCT_RANK.toString())),
      DataCell(Text(item.FTA_RATE_RANK.toString())),
      DataCell(Text(item.TM_TOV_PCT_RANK.toString())),
      DataCell(Text(item.OREB_PCT_RANK.toString())),
      DataCell(Text(item.OPP_EFG_PCT_RANK.toString())),
      DataCell(Text(item.OPP_FTA_RATE_RANK.toString())),
      DataCell(Text(item.OPP_TOV_PCT_RANK.toString())),
      DataCell(Text(item.OPP_OREB_PCT_RANK.toString())),
      //DataCell(Text(item.CFID)),
      //DataCell(Text(item.CFPARAMS)),
    ]);
  }

  List<DataColumn> getFourFactorDataColumns() {
    List<DataColumn> list = [];
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(
        label: Text('TEAM_NAME'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('GP'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('W'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('L'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('W %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('MIN'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('EFG %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP EFG %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(
        label: Text('FTA RATE'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FTA RATE'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));

    list.add(DataColumn(
        label: Text('TM TOV %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP TOV %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Diff')));
    list.add(DataColumn(label: Text('')));

    list.add(DataColumn(
        label: Text('OREB %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP OREB %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
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
    // list.add(DataColumn(label: Text('CFID')));
    // list.add(DataColumn(label: Text('CFPARAMS')));

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
      if (sort) {
        stats.sortTeam(false);
      } else {
        stats.sortTeam(true);
      }
    }
    if (colIndex == 2) {
      if (sort) {
        stats.sortGP(false);
      } else {
        stats.sortGP(true);
      }
    }
    if (colIndex == 3) {
      if (sort) {
        stats.sortW(false);
      } else {
        stats.sortW(true);
      }
    }
    if (colIndex == 4) {
      if (sort) {
        stats.sortL(false);
      } else {
        stats.sortL(true);
      }
    }
    if (colIndex == 5) {
      if (sort) {
        stats.sortWPCT(false);
      } else {
        stats.sortWPCT(true);
      }
    }
    if (colIndex == 6) {
      if (sort) {
        stats.sortMin(false);
      } else {
        stats.sortMin(true);
      }
    }
    if (colIndex == 7) {
      if (sort) {
        stats.sortEFGPct(false);
      } else {
        stats.sortEFGPct(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        stats.sortOppEFGPct(false);
      } else {
        stats.sortOppEFGPct(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        stats.sortFTARate(false);
      } else {
        stats.sortFTARate(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        stats.sortOppFtaRate(false);
      } else {
        stats.sortOppFtaRate(true);
      }
    }
    if (colIndex == 17) {
      if (sort) {
        stats.sortTmTovPct(false);
      } else {
        stats.sortTmTovPct(true);
      }
    }
    if (colIndex == 18) {
      if (sort) {
        stats.sortOppTovPct(false);
      } else {
        stats.sortOppTovPct(true);
      }
    }
    if (colIndex == 22) {
      if (sort) {
        stats.sortORebPct(false);
      } else {
        stats.sortORebPct(true);
      }
    }
    if (colIndex == 23) {
      if (sort) {
        stats.sortOppORebPct(false);
      } else {
        stats.sortOppORebPct(true);
      }
    }
  }
}
