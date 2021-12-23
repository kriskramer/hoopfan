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
    for (var i in stats.items) {
      list.add(getAdvancedDataRow(i));
    }
    return list;
  }

  DataRow getAdvancedDataRow(AdvancedStatsLeague item) {
    return DataRow(cells: [
      // DataCell(Text(item.TEAM_ID.toString())),
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
      //DataCell(Text(item.E_OFF_RATING.toString())),
      DataCell(Text(item.OFF_RATING.toString())),
      //DataCell(Text(item.E_DEF_RATING.toString())),
      DataCell(Text(item.DEF_RATING.toString())),
      //DataCell(Text(item.E_NET_RATING.toString())),
      DataCell(Text(item.NET_RATING.toString())),
      DataCell(Text(item.AST_PCT.toString())),
      DataCell(Text(item.AST_TO.toString())),
      DataCell(Text(item.AST_RATIO.toString())),
      DataCell(Text(item.OREB_PCT.toString())),
      DataCell(Text(item.DREB_PCT.toString())),
      DataCell(Text(item.REB_PCT.toString())),
      DataCell(Text(item.TM_TOV_PCT.toString())),
      DataCell(Text(item.EFG_PCT.toString())),
      DataCell(Text(item.TS_PCT.toString())),
      //DataCell(Text(item.E_PACE.toString())),
      DataCell(Text(item.PACE.toString())),
      DataCell(Text(item.PACE_PER40.toString())),
      DataCell(Text(item.POSS.toString())),
      DataCell(Text(item.PIE.toString())),
      DataCell(Text(item.GP_RANK.toString())),
      DataCell(Text(item.W_RANK.toString())),
      DataCell(Text(item.L_RANK.toString())),
      DataCell(Text(item.W_PCT_RANK.toString())),
      DataCell(Text(item.MIN_RANK.toString())),
      DataCell(Text(item.OFF_RATING_RANK.toString())),
      DataCell(Text(item.DEF_RATING_RANK.toString())),
      DataCell(Text(item.NET_RATING_RANK.toString())),
      DataCell(Text(item.AST_PCT_RANK.toString())),
      DataCell(Text(item.AST_TO_RANK.toString())),
      DataCell(Text(item.AST_RATIO_RANK.toString())),
      DataCell(Text(item.OREB_PCT_RANK.toString())),
      DataCell(Text(item.DREB_PCT_RANK.toString())),
      DataCell(Text(item.REB_PCT_RANK.toString())),
      DataCell(Text(item.TM_TOV_PCT_RANK.toString())),
      DataCell(Text(item.EFG_PCT_RANK.toString())),
      DataCell(Text(item.TS_PCT_RANK.toString())),
      DataCell(Text(item.PACE_RANK.toString())),
      DataCell(Text(item.PIE_RANK.toString())),
      // DataCell(Text(item.CFID.toString())),
      // DataCell(Text(item.CFPARAMS.toString())),
    ]);
  }

  List<DataColumn> getAdvancedDataColumns() {
    List<DataColumn> list = [];
    //list.add(DataColumn(label: Text('TEAM ID')));
    list.add(DataColumn(
        label: Text('TEAM NAME'),
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
    //list.add(DataColumn(label: Text('E OFF RATING')));
    list.add(DataColumn(
        label: Text('OFF RTG'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    //list.add(DataColumn(label: Text('E DEF RATING')));
    list.add(DataColumn(
        label: Text('DEF RTG'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    //list.add(DataColumn(label: Text('E NET RATING')));
    list.add(DataColumn(
        label: Text('NET RTG'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('AST %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('AST TO'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('AST RATIO'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OREB %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('DREB %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('REB %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('TM TOV %'),
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
        label: Text('TS %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    //list.add(DataColumn(label: Text('E PACE')));
    list.add(DataColumn(
        label: Text('PACE'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PACE/40'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('POSS'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PIE'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
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
    // list.add(DataColumn(label: Text('CFID')));
    // list.add(DataColumn(label: Text('CFPARAMS')));

    return list;
  }

  void doAdvancedSort(AdvancedStatsLeagueList stats) {
    if (colIndex == 0) {
      if (sort) {
        stats.sortTeam(false);
      } else {
        stats.sortTeam(true);
      }
    }
    if (colIndex == 1) {
      if (sort) {
        stats.sortGP(false);
      } else {
        stats.sortGP(true);
      }
    }
    if (colIndex == 2) {
      if (sort) {
        stats.sortW(false);
      } else {
        stats.sortW(true);
      }
    }
    if (colIndex == 3) {
      if (sort) {
        stats.sortL(false);
      } else {
        stats.sortL(true);
      }
    }
    if (colIndex == 4) {
      if (sort) {
        stats.sortWPCT(false);
      } else {
        stats.sortWPCT(true);
      }
    }
    if (colIndex == 5) {
      if (sort) {
        stats.sortMin(false);
      } else {
        stats.sortMin(true);
      }
    }
    if (colIndex == 6) {
      if (sort) {
        stats.sortORTG(false);
      } else {
        stats.sortORTG(true);
      }
    }
    if (colIndex == 7) {
      if (sort) {
        stats.sortDRTG(false);
      } else {
        stats.sortDRTG(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        stats.sortNET(false);
      } else {
        stats.sortNET(true);
      }
    }
    if (colIndex == 9) {
      if (sort) {
        stats.sortASTPCT(false);
      } else {
        stats.sortASTPCT(true);
      }
    }
    if (colIndex == 10) {
      if (sort) {
        stats.sortASTTOV(false);
      } else {
        stats.sortASTTOV(true);
      }
    }
    if (colIndex == 11) {
      if (sort) {
        stats.sortASTRATIO(false);
      } else {
        stats.sortASTRATIO(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        stats.sortOREBPCT(false);
      } else {
        stats.sortOREBPCT(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        stats.sortDREBPCT(false);
      } else {
        stats.sortDREBPCT(true);
      }
    }
    if (colIndex == 14) {
      if (sort) {
        stats.sortREBPCT(false);
      } else {
        stats.sortREBPCT(true);
      }
    }
    if (colIndex == 15) {
      if (sort) {
        stats.sortTMTOVPCT(false);
      } else {
        stats.sortTMTOVPCT(true);
      }
    }
    if (colIndex == 16) {
      if (sort) {
        stats.sortEFG(false);
      } else {
        stats.sortEFG(true);
      }
    }
    if (colIndex == 17) {
      if (sort) {
        stats.sortTS(false);
      } else {
        stats.sortTS(true);
      }
    }
    if (colIndex == 18) {
      if (sort) {
        stats.sortPACE(false);
      } else {
        stats.sortPACE(true);
      }
    }
    if (colIndex == 19) {
      if (sort) {
        stats.sortPACE40(false);
      } else {
        stats.sortPACE40(true);
      }
    }
    if (colIndex == 20) {
      if (sort) {
        stats.sortPOSS(false);
      } else {
        stats.sortPOSS(true);
      }
    }
    if (colIndex == 21) {
      if (sort) {
        stats.sortPIE(false);
      } else {
        stats.sortPIE(true);
      }
    }
  }
}
