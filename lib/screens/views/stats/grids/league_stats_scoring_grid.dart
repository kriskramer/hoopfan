import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/scoring_stats_league.dart';

class LeagueStatsScoringGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsScoringGrid(this.stats);

  @override
  _LeagueStatsScoringGridState createState() => _LeagueStatsScoringGridState();
}

class _LeagueStatsScoringGridState extends State<LeagueStatsScoringGrid> {
  bool sort = true;
  int colIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScoringStatsLeagueList sStats = ScoringStatsLeagueList(widget.stats);

    doSort(sStats);

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
        columns: [...getScoringDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableScoringRows(sStats),
        ],
      ),
    );
  }

  List<DataRow> getVariableScoringRows(ScoringStatsLeagueList stats) {
    List<DataRow> list = [];
    for (var i in stats.items) {
      list.add(getScoringDataRow(i));
    }
    return list;
  }

  DataRow getScoringDataRow(ScoringStatsLeague item) {
    return DataRow(cells: [
      //DataCell(Text(item.TEAM_ID.toString())),
      DataCell(Text(item.TEAM_NAME.toString())),
      DataCell(Text(item.GP.toString())),
      DataCell(Text(item.W.toString())),
      DataCell(Text(item.L.toString())),
      DataCell(Text(item.W_PCT.toString())),
      DataCell(Text(item.MIN.toString())),
      DataCell(Text(item.PCT_FGA_2PT.toString())),
      DataCell(Text(item.PCT_FGA_3PT.toString())),
      DataCell(Text(item.PCT_PTS_2PT.toString())),
      DataCell(Text(item.PCT_PTS_2PT_MR.toString())),
      DataCell(Text(item.PCT_PTS_3PT.toString())),
      DataCell(Text(item.PCT_PTS_FB.toString())),
      DataCell(Text(item.PCT_PTS_FT.toString())),
      DataCell(Text(item.PCT_PTS_OFF_TOV.toString())),
      DataCell(Text(item.PCT_PTS_PAINT.toString())),
      DataCell(Text(item.PCT_AST_2PM.toString())),
      DataCell(Text(item.PCT_UAST_2PM.toString())),
      DataCell(Text(item.PCT_AST_3PM.toString())),
      DataCell(Text(item.PCT_UAST_3PM.toString())),
      DataCell(Text(item.PCT_AST_FGM.toString())),
      DataCell(Text(item.PCT_UAST_FGM.toString())),
      DataCell(Text(item.GP_RANK.toString())),
      DataCell(Text(item.W_RANK.toString())),
      DataCell(Text(item.L_RANK.toString())),
      DataCell(Text(item.W_PCT_RANK.toString())),
      DataCell(Text(item.MIN_RANK.toString())),
      DataCell(Text(item.PCT_FGA_2PT_RANK.toString())),
      DataCell(Text(item.PCT_FGA_3PT_RANK.toString())),
      DataCell(Text(item.PCT_PTS_2PT_RANK.toString())),
      DataCell(Text(item.PCT_PTS_2PT_MR_RANK.toString())),
      DataCell(Text(item.PCT_PTS_3PT_RANK.toString())),
      DataCell(Text(item.PCT_PTS_FB_RANK.toString())),
      DataCell(Text(item.PCT_PTS_FT_RANK.toString())),
      DataCell(Text(item.PCT_PTS_OFF_TOV_RANK.toString())),
      DataCell(Text(item.PCT_PTS_PAINT_RANK.toString())),
      DataCell(Text(item.PCT_AST_2PM_RANK.toString())),
      DataCell(Text(item.PCT_UAST_2PM_RANK.toString())),
      DataCell(Text(item.PCT_AST_3PM_RANK.toString())),
      DataCell(Text(item.PCT_UAST_3PM_RANK.toString())),
      DataCell(Text(item.PCT_AST_FGM_RANK.toString())),
      DataCell(Text(item.PCT_UAST_FGM_RANK.toString())),
      //DataCell(Text(item.CFID.toString())),
      //DataCell(Text(item.CFPARAMS.toString())),
    ]);
  }

  List<DataColumn> getScoringDataColumns() {
    List<DataColumn> list = [];

    //list.add(DataColumn(label: Text('TEAM_ID')));
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
    list.add(DataColumn(
        label: Text('% FGA 2PT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% FGA 3PT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS 2PT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS 2PT MR'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS 3PT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS FB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS FT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS OFF TOV'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% PTS PAINT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% AST 2PM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% UAST 2PM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% AST 3PM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% UAST 3PM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% AST FGM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('% UAST FGM'),
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
    list.add(DataColumn(label: Text('% FGA 2PT RANK')));
    list.add(DataColumn(label: Text('% FGA 3PT RANK')));
    list.add(DataColumn(label: Text('% PTS 2PT RANK')));
    list.add(DataColumn(label: Text('% PTS 2PT MR RANK')));
    list.add(DataColumn(label: Text('% PTS 3PT RANK')));
    list.add(DataColumn(label: Text('% PTS FB RANK')));
    list.add(DataColumn(label: Text('% PTS FT RANK')));
    list.add(DataColumn(label: Text('% PTS OFF TOV RANK')));
    list.add(DataColumn(label: Text('% PTS PAINT RANK')));
    list.add(DataColumn(label: Text('% AST 2PM RANK')));
    list.add(DataColumn(label: Text('% UAST 2PM RANK')));
    list.add(DataColumn(label: Text('% AST 3PM RANK')));
    list.add(DataColumn(label: Text('% UAST 3PM RANK')));
    list.add(DataColumn(label: Text('% AST FGM RANK')));
    list.add(DataColumn(label: Text('% UAST FGM RANK')));
    //list.add(DataColumn(label: Text('CFID')));
    //list.add(DataColumn(label: Text('CFPARAMS')));

    return list;
  }

  void doSort(ScoringStatsLeagueList stats) {
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
        stats.sortPctFga2pt(false);
      } else {
        stats.sortPctFga2pt(true);
      }
    }
    if (colIndex == 7) {
      if (sort) {
        stats.sortPctFga3pt(false);
      } else {
        stats.sortPctFga3pt(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        stats.sortPctPts2pt(false);
      } else {
        stats.sortPctPts2pt(true);
      }
    }
    if (colIndex == 9) {
      if (sort) {
        stats.sortPctPts2ptMr(false);
      } else {
        stats.sortPctPts2ptMr(true);
      }
    }
    if (colIndex == 10) {
      if (sort) {
        stats.sortPctPts3pt(false);
      } else {
        stats.sortPctPts3pt(true);
      }
    }
    if (colIndex == 11) {
      if (sort) {
        stats.sortPctPtsFb(false);
      } else {
        stats.sortPctPtsFb(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        stats.sortPctPtsFt(false);
      } else {
        stats.sortPctPtsFt(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        stats.sortPctPtsTov(false);
      } else {
        stats.sortPctPtsTov(true);
      }
    }
    if (colIndex == 14) {
      if (sort) {
        stats.sortPctPtsPaint(false);
      } else {
        stats.sortPctPtsPaint(true);
      }
    }
    if (colIndex == 15) {
      if (sort) {
        stats.sortPctAST2pm(false);
      } else {
        stats.sortPctAST2pm(true);
      }
    }
    if (colIndex == 16) {
      if (sort) {
        stats.sortPctUAST2pm(false);
      } else {
        stats.sortPctUAST2pm(true);
      }
    }

    if (colIndex == 17) {
      if (sort) {
        stats.sortPctAST3pm(false);
      } else {
        stats.sortPctAST3pm(true);
      }
    }

    if (colIndex == 18) {
      if (sort) {
        stats.sortPctUAST3pm(false);
      } else {
        stats.sortPctUAST3pm(true);
      }
    }

    if (colIndex == 19) {
      if (sort) {
        stats.sortPctAstFgm(false);
      } else {
        stats.sortPctAstFgm(true);
      }
    }

    if (colIndex == 20) {
      if (sort) {
        stats.sortPctUAstFgm(false);
      } else {
        stats.sortPctUAstFgm(true);
      }
    }
  }
}
