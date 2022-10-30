import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/advanced_stats_league.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class LeagueStatsAdvancedGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsAdvancedGrid(this.stats);

  @override
  _LeagueStatsAdvancedGridState createState() =>
      _LeagueStatsAdvancedGridState();
}

class _LeagueStatsAdvancedGridState extends State<LeagueStatsAdvancedGrid> {
  bool sort = true;
  int colIndex = 0;
  int selectedTeamId = 0;

  @override
  Widget build(BuildContext context) {
    AdvancedStatsLeagueList advStats = AdvancedStatsLeagueList(widget.stats);

    doAdvancedSort(advStats);

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
        columns: [...getAdvancedDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableAdvancedRows(advStats),
        ],
      ),
    );
  }

  List<DataRow> getVariableAdvancedRows(AdvancedStatsLeagueList stats) {
    List<DataRow> list = [];
    int counter = 1;
    for (var i in stats.items) {
      list.add(getAdvancedDataRow(i, counter));
      counter++;
    }
    return list;
  }

  DataRow getAdvancedDataRow(AdvancedStatsLeague item, int index) {
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
          getDataCell(item.offRating.toString(), item.offRating_RANK, item),
          getDataCell(item.defRating.toString(), item.defRating_RANK, item),
          getDataCell(item.netRating.toString(), item.netRating_RANK, item),
          getDataCell(item.astPct.toString(), item.astPct_RANK, item),
          getDataCell(item.AST_TO.toString(), item.AST_TO_RANK, item),
          getDataCell(item.astRatio.toString(), item.astRatio_RANK, item),
          getDataCell(item.oRebPct.toString(), item.oRebPct_RANK, item),
          getDataCell(item.dRebPct.toString(), item.dRebPct_RANK, item),
          getDataCell(item.rebPct.toString(), item.rebPct_RANK, item),
          getDataCell(item.tmTovPct.toString(), item.tmTovPct_RANK, item),
          getDataCell(item.eFgPct.toString(), item.eFgPct_RANK, item),
          getDataCell(item.tsPct.toString(), item.tsPct_RANK, item),
          getDataCell(item.PACE.toString(), item.PACE_RANK, item),
          getDataCell(item.pacePer40.toString(), 0, item),
          getDataCell(item.POSS.toString(), 0, item),
          getDataCell(item.PIE.toString(), item.PIE_RANK, item),
          getDataCell(item.GP_RANK.toString(), item.GP_RANK, item),
          getDataCell(item.W_RANK.toString(), item.W_RANK, item),
          getDataCell(item.L_RANK.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT_RANK.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN_RANK.toString(), item.MIN_RANK, item),
          getDataCell(
              item.offRating_RANK.toString(), item.offRating_RANK, item),
          getDataCell(
              item.defRating_RANK.toString(), item.defRating_RANK, item),
          getDataCell(
              item.netRating_RANK.toString(), item.netRating_RANK, item),
          getDataCell(item.astPct_RANK.toString(), item.astPct_RANK, item),
          getDataCell(item.AST_TO_RANK.toString(), item.AST_TO_RANK, item),
          getDataCell(item.astRatio_RANK.toString(), item.astRatio_RANK, item),
          getDataCell(item.oRebPct_RANK.toString(), item.oRebPct_RANK, item),
          getDataCell(item.dRebPct_RANK.toString(), item.dRebPct_RANK, item),
          getDataCell(item.rebPct_RANK.toString(), item.rebPct_RANK, item),
          getDataCell(item.tmTovPct_RANK.toString(), item.tmTovPct_RANK, item),
          getDataCell(item.eFgPct_RANK.toString(), item.eFgPct_RANK, item),
          getDataCell(item.tsPct_RANK.toString(), item.tsPct_RANK, item),
          getDataCell(item.PACE_RANK.toString(), item.PACE_RANK, item),
          getDataCell(item.PIE_RANK.toString(), item.PIE_RANK, item),
        ]);
  }

  List<DataColumn> getAdvancedDataColumns() {
    List<DataColumn> list = [];
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('TEAM NAME'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W'), onSort: sortFunction));
    list.add(DataColumn(label: Text('L'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('MIN'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OFF RTG'), onSort: sortFunction));
    list.add(DataColumn(label: Text('DEF RTG'), onSort: sortFunction));
    list.add(DataColumn(label: Text('NET RTG'), onSort: sortFunction));
    list.add(DataColumn(label: Text('AST %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('AST TO'), onSort: sortFunction));
    list.add(DataColumn(label: Text('AST RATIO'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OREB %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('DREB %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('REB %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('TM TOV %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('EFG %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('TS %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PACE'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PACE/40'), onSort: sortFunction));
    list.add(DataColumn(label: Text('POSS'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PIE'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP RANK')));
    list.add(DataColumn(label: Text('W RANK')));
    list.add(DataColumn(label: Text('L RANK')));
    list.add(DataColumn(label: Text('W % RANK')));
    list.add(DataColumn(label: Text('MIN RANK')));
    list.add(DataColumn(label: Text('OFF RTG RANK')));
    list.add(DataColumn(label: Text('DEF RTG RANK')));
    list.add(DataColumn(label: Text('NET RTG RANK')));
    list.add(DataColumn(label: Text('AST % RANK')));
    list.add(DataColumn(label: Text('AST TO RANK')));
    list.add(DataColumn(label: Text('AST RATIO RANK')));
    list.add(DataColumn(label: Text('OREB % RANK')));
    list.add(DataColumn(label: Text('DREB % RANK')));
    list.add(DataColumn(label: Text('REB % RANK')));
    list.add(DataColumn(label: Text('TM TOV % RANK')));
    list.add(DataColumn(label: Text('EFG % RANK')));
    list.add(DataColumn(label: Text('TS % RANK')));
    list.add(DataColumn(label: Text('PACE RANK')));
    list.add(DataColumn(label: Text('PIE RANK')));

    return list;
  }

  void doAdvancedSort(AdvancedStatsLeagueList stats) {
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
      stats.sortORTG(sort);
    }
    if (colIndex == 8) {
      stats.sortDRTG(sort);
    }
    if (colIndex == 9) {
      stats.sortNET(sort);
    }
    if (colIndex == 10) {
      stats.sortASTPCT(sort);
    }
    if (colIndex == 11) {
      stats.sortASTTOV(sort);
    }
    if (colIndex == 12) {
      stats.sortASTRATIO(sort);
    }
    if (colIndex == 13) {
      stats.sortOREBPCT(sort);
    }
    if (colIndex == 14) {
      stats.sortDREBPCT(sort);
    }
    if (colIndex == 15) {
      stats.sortREBPCT(sort);
    }
    if (colIndex == 16) {
      stats.sortTMTOVPCT(sort);
    }
    if (colIndex == 17) {
      stats.sortEFG(sort);
    }
    if (colIndex == 18) {
      stats.sortTS(sort);
    }
    if (colIndex == 19) {
      stats.sortPACE(sort);
    }
    if (colIndex == 20) {
      stats.sortPACE40(sort);
    }
    if (colIndex == 21) {
      stats.sortPOSS(sort);
    }
    if (colIndex == 22) {
      stats.sortPIE(sort);
    }
  }

  DataCell getDataCell(String value, int rank, AdvancedStatsLeague item) {
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
