import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/scoring_stats_league.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class LeagueStatsScoringGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsScoringGrid(this.stats);

  @override
  _LeagueStatsScoringGridState createState() => _LeagueStatsScoringGridState();
}

class _LeagueStatsScoringGridState extends State<LeagueStatsScoringGrid> {
  bool sort = true;
  int colIndex = 0;
  int selectedTeamId = 0;

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
    int counter = 1;
    for (var i in stats.items) {
      list.add(getScoringDataRow(i, counter));
      counter++;
    }
    return list;
  }

  DataRow getScoringDataRow(ScoringStatsLeague item, int index) {
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
          getDataCell(item.PCT_FGA_2PT.toString(), item.PCT_FGA_2PT_RANK, item),
          getDataCell(item.PCT_FGA_3PT.toString(), item.PCT_FGA_3PT_RANK, item),
          getDataCell(item.PCT_PTS_2PT.toString(), item.PCT_PTS_2PT_RANK, item),
          getDataCell(
              item.PCT_PTS_2PT_MR.toString(), item.PCT_PTS_2PT_MR_RANK, item),
          getDataCell(item.PCT_PTS_3PT.toString(), item.PCT_PTS_3PT_RANK, item),
          getDataCell(item.PCT_PTS_FB.toString(), item.PCT_PTS_FB_RANK, item),
          getDataCell(item.PCT_PTS_FT.toString(), item.PCT_PTS_FT_RANK, item),
          getDataCell(
              item.PCT_PTS_OFF_TOV.toString(), item.PCT_PTS_OFF_TOV_RANK, item),
          getDataCell(
              item.PCT_PTS_PAINT.toString(), item.PCT_PTS_PAINT_RANK, item),
          getDataCell(item.PCT_AST_2PM.toString(), item.PCT_AST_2PM_RANK, item),
          getDataCell(
              item.PCT_UAST_2PM.toString(), item.PCT_UAST_2PM_RANK, item),
          getDataCell(item.PCT_AST_3PM.toString(), item.PCT_AST_3PM_RANK, item),
          getDataCell(
              item.PCT_UAST_3PM.toString(), item.PCT_UAST_3PM_RANK, item),
          getDataCell(item.PCT_AST_FGM.toString(), item.PCT_AST_FGM_RANK, item),
          getDataCell(
              item.PCT_UAST_FGM.toString(), item.PCT_UAST_FGM_RANK, item),
          getDataCell(item.GP_RANK.toString(), item.GP_RANK, item),
          getDataCell(item.W_RANK.toString(), item.W_RANK, item),
          getDataCell(item.L_RANK.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT_RANK.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN_RANK.toString(), item.MIN_RANK, item),
          getDataCell(
              item.PCT_FGA_2PT_RANK.toString(), item.PCT_FGA_2PT_RANK, item),
          getDataCell(
              item.PCT_FGA_3PT_RANK.toString(), item.PCT_FGA_3PT_RANK, item),
          getDataCell(
              item.PCT_PTS_2PT_RANK.toString(), item.PCT_PTS_2PT_RANK, item),
          getDataCell(item.PCT_PTS_2PT_MR_RANK.toString(),
              item.PCT_PTS_2PT_MR_RANK, item),
          getDataCell(
              item.PCT_PTS_3PT_RANK.toString(), item.PCT_PTS_3PT_RANK, item),
          getDataCell(
              item.PCT_PTS_FB_RANK.toString(), item.PCT_PTS_FB_RANK, item),
          getDataCell(
              item.PCT_PTS_FT_RANK.toString(), item.PCT_PTS_FT_RANK, item),
          getDataCell(item.PCT_PTS_OFF_TOV_RANK.toString(),
              item.PCT_PTS_OFF_TOV_RANK, item),
          getDataCell(item.PCT_PTS_PAINT_RANK.toString(),
              item.PCT_PTS_PAINT_RANK, item),
          getDataCell(
              item.PCT_AST_2PM_RANK.toString(), item.PCT_AST_2PM_RANK, item),
          getDataCell(
              item.PCT_UAST_2PM_RANK.toString(), item.PCT_UAST_2PM_RANK, item),
          getDataCell(
              item.PCT_AST_3PM_RANK.toString(), item.PCT_AST_3PM_RANK, item),
          getDataCell(
              item.PCT_UAST_3PM_RANK.toString(), item.PCT_UAST_3PM_RANK, item),
          getDataCell(
              item.PCT_AST_FGM_RANK.toString(), item.PCT_AST_FGM_RANK, item),
          getDataCell(
              item.PCT_UAST_FGM_RANK.toString(), item.PCT_UAST_FGM_RANK, item),
        ]);
  }

  List<DataColumn> getScoringDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('TEAM NAME'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W'), onSort: sortFunction));
    list.add(DataColumn(label: Text('L'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('MIN'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% FGA 2PT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% FGA 3PT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS 2PT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS 2PT MR'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS 3PT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS FB'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS FT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS OFF TOV'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% PTS PAINT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% AST 2PM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% UAST 2PM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% AST 3PM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% UAST 3PM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% AST FGM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('% UAST FGM'), onSort: sortFunction));
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

    return list;
  }

  void doSort(ScoringStatsLeagueList stats) {
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
      stats.sortPctFga2pt(sort);
    }
    if (colIndex == 8) {
      stats.sortPctFga3pt(sort);
    }
    if (colIndex == 9) {
      stats.sortPctPts2pt(sort);
    }
    if (colIndex == 10) {
      stats.sortPctPts2ptMr(sort);
    }
    if (colIndex == 11) {
      stats.sortPctPts3pt(sort);
    }
    if (colIndex == 12) {
      stats.sortPctPtsFb(sort);
    }
    if (colIndex == 13) {
      stats.sortPctPtsFt(sort);
    }
    if (colIndex == 14) {
      stats.sortPctPtsTov(sort);
    }
    if (colIndex == 15) {
      stats.sortPctPtsPaint(sort);
    }
    if (colIndex == 16) {
      stats.sortPctAST2pm(sort);
    }
    if (colIndex == 17) {
      stats.sortPctUAST2pm(sort);
    }
    if (colIndex == 18) {
      stats.sortPctAST3pm(sort);
    }
    if (colIndex == 19) {
      stats.sortPctUAST3pm(sort);
    }
    if (colIndex == 20) {
      stats.sortPctAstFgm(sort);
    }
    if (colIndex == 21) {
      stats.sortPctUAstFgm(sort);
    }
  }

  DataCell getDataCell(String value, int rank, ScoringStatsLeague item) {
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
