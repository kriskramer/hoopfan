import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/opponent_stats_league.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class LeagueStatsOpponentGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsOpponentGrid(this.stats);

  @override
  State<LeagueStatsOpponentGrid> createState() =>
      _LeagueStatsOpponentGridState();
}

class _LeagueStatsOpponentGridState extends State<LeagueStatsOpponentGrid> {
  bool sort = true;
  int colIndex = 0;
  int selectedTeamId = 0;

  @override
  Widget build(BuildContext context) {
    OpponentStatsLeagueList OpponentStats =
        OpponentStatsLeagueList(widget.stats);

    doOpponentSort(OpponentStats);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        headingRowHeight: 25,
        dataRowHeight: 25,
        // dataRowColor: MaterialStateProperty.resolveWith<Color>(
        //     (Set<MaterialState> states) {
        //   return Colors.green[300];
        // }),
        headingTextStyle:
            TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.grey[300];
        }),
        columns: [...getOpponentDataColumns()],
        rows: [...getVariableOpponentRows(OpponentStats)],
      ),
    );
  }

  List<DataRow> getVariableOpponentRows(OpponentStatsLeagueList stats) {
    List<DataRow> list = [];
    int counter = 1;
    for (var i in stats.items) {
      list.add(getOpponentDataRow(i, counter));
      counter++;
    }
    return list;
  }

  DataRow getOpponentDataRow(OpponentStatsLeague item, int index) {
    return DataRow(
        color: MaterialStateColor.resolveWith((states) {
          if (item.TEAM_ID == selectedTeamId) {
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
                      return TeamDetails(nbaTeamId: item.TEAM_ID.toString());
                    });
              },
              onTap: () {
                setState(() {
                  selectedTeamId = item.TEAM_ID;
                });
              },
              child: Text(item.TEAM_NAME))),
          getDataCell(item.GP.toString(), item.GP_RANK, item),
          getDataCell(item.W.toString(), item.W_RANK, item),
          getDataCell(item.L.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN.toString(), item.MIN_RANK, item),
          getDataCell(item.FGM.toString(), item.FGM_RANK, item),
          getDataCell(item.FGA.toString(), item.FGA_RANK, item),
          getDataCell(item.FG_PCT.toString(), item.FG_PCT_RANK, item),
          getDataCell(item.FG3M.toString(), item.FG3M_RANK, item),
          getDataCell(item.FG3A.toString(), item.FG3A_RANK, item),
          getDataCell(item.FG3_PCT.toString(), item.FG3_PCT_RANK, item),
          getDataCell(item.FTM.toString(), item.FTM_RANK, item),
          getDataCell(item.FTA.toString(), item.FTA_RANK, item),
          getDataCell(item.FT_PCT.toString(), item.FT_PCT_RANK, item),
          getDataCell(item.OREB.toString(), item.OREB_RANK, item),
          getDataCell(item.DREB.toString(), item.DREB_RANK, item),
          getDataCell(item.REB.toString(), item.REB_RANK, item),
          getDataCell(item.AST.toString(), item.AST_RANK, item),
          getDataCell(item.TOV.toString(), item.TOV_RANK, item),
          getDataCell(item.STL.toString(), item.STL_RANK, item),
          getDataCell(item.BLK.toString(), item.BLK_RANK, item),
          getDataCell(item.BLKA.toString(), item.BLKA_RANK, item),
          getDataCell(item.PF.toString(), item.PF_RANK, item),
          getDataCell(item.PFD.toString(), item.PFD_RANK, item),
          getDataCell(item.PTS.toString(), item.PTS_RANK, item),
          getDataCell(item.PLUS_MINUS.toString(), item.PLUS_MINUS_RANK, item),
          getDataCell(item.GP_RANK.toString(), item.GP_RANK, item),
          getDataCell(item.W_RANK.toString(), item.W_RANK, item),
          getDataCell(item.L_RANK.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT_RANK.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN_RANK.toString(), item.MIN_RANK, item),
          getDataCell(item.FGM_RANK.toString(), item.FGM_RANK, item),
          getDataCell(item.FGA_RANK.toString(), item.FGA_RANK, item),
          getDataCell(item.FG_PCT_RANK.toString(), item.FG_PCT_RANK, item),
          getDataCell(item.FG3M_RANK.toString(), item.FG3M_RANK, item),
          getDataCell(item.FG3A_RANK.toString(), item.FG3A_RANK, item),
          getDataCell(item.FG3_PCT_RANK.toString(), item.FG3_PCT_RANK, item),
          getDataCell(item.FTM_RANK.toString(), item.FTM_RANK, item),
          getDataCell(item.FTA_RANK.toString(), item.FTA_RANK, item),
          getDataCell(item.FT_PCT_RANK.toString(), item.FT_PCT_RANK, item),
          getDataCell(item.OREB_RANK.toString(), item.OREB_RANK, item),
          getDataCell(item.DREB_RANK.toString(), item.DREB_RANK, item),
          getDataCell(item.REB_RANK.toString(), item.REB_RANK, item),
          getDataCell(item.AST_RANK.toString(), item.AST_RANK, item),
          getDataCell(item.TOV_RANK.toString(), item.TOV_RANK, item),
          getDataCell(item.STL_RANK.toString(), item.STL_RANK, item),
          getDataCell(item.BLK_RANK.toString(), item.BLK_RANK, item),
          getDataCell(item.BLKA_RANK.toString(), item.BLKA_RANK, item),
          getDataCell(item.PF_RANK.toString(), item.PF_RANK, item),
          getDataCell(item.PFD_RANK.toString(), item.PFD_RANK, item),
          getDataCell(item.PTS_RANK.toString(), item.PTS_RANK, item),
          getDataCell(
              item.PLUS_MINUS_RANK.toString(), item.PLUS_MINUS_RANK, item),
        ]);
  }

  List<DataColumn> getOpponentDataColumns() {
    List<DataColumn> list = [];
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('Team'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W'), onSort: sortFunction));
    list.add(DataColumn(label: Text('L'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('MIN'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FGM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FGA'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG3M'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG3A'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG3 %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FTM'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FTA'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FT %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OREB'), onSort: sortFunction));
    list.add(DataColumn(label: Text('DREB'), onSort: sortFunction));
    list.add(DataColumn(label: Text('REB'), onSort: sortFunction));
    list.add(DataColumn(label: Text('AST'), onSort: sortFunction));
    list.add(DataColumn(label: Text('TOV'), onSort: sortFunction));
    list.add(DataColumn(label: Text('STL'), onSort: sortFunction));
    list.add(DataColumn(label: Text('BLK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('BLKA'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PF'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PFD'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PTS'), onSort: sortFunction));
    list.add(DataColumn(label: Text('+/-'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('L RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W % RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('MIN RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FGM RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FGA RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG % RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG3M RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG3A RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FG3 % RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FTM RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FTA RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('FT % RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OREB RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('DREB RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('REB RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('AST RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('TOV RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('STL RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('BLK RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('BLKA RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PF RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PFD RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PTS RANK'), onSort: sortFunction));
    list.add(DataColumn(label: Text('+/- RANK'), onSort: sortFunction));

    return list;
  }

  void doOpponentSort(OpponentStatsLeagueList stats) {
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
      stats.sortFGM(sort);
    }
    if (colIndex == 8) {
      stats.sortFGA(sort);
    }
    if (colIndex == 9) {
      stats.sortFGPCT(sort);
    }
    if (colIndex == 10) {
      stats.sortFG3M(sort);
    }
    if (colIndex == 11) {
      stats.sortFG3A(sort);
    }
    if (colIndex == 12) {
      stats.sortFG3PCT(sort);
    }
    if (colIndex == 13) {
      stats.sortFTM(sort);
    }
    if (colIndex == 14) {
      stats.sortFTA(sort);
    }
    if (colIndex == 15) {
      stats.sortFTPCT(sort);
    }
    if (colIndex == 16) {
      stats.sortOREB(sort);
    }
    if (colIndex == 17) {
      stats.sortDREB(sort);
    }
    if (colIndex == 18) {
      stats.sortREB(sort);
    }
    if (colIndex == 19) {
      stats.sortAST(sort);
    }
    if (colIndex == 20) {
      stats.sortTOV(sort);
    }
    if (colIndex == 21) {
      stats.sortSTL(sort);
    }
    if (colIndex == 22) {
      stats.sortBLK(sort);
    }
    if (colIndex == 23) {
      stats.sortBLKA(sort);
    }
    if (colIndex == 24) {
      stats.sortPF(sort);
    }
    if (colIndex == 25) {
      stats.sortPFD(sort);
    }
    if (colIndex == 26) {
      stats.sortPTS(sort);
    }
    if (colIndex == 27) {
      stats.sortPLUSMINUS(sort);
    }
  }

  DataCell getDataCell(String value, int rank, OpponentStatsLeague item) {
    return DataCell(Text(value, style: rankColors(rank)), onTap: () {
      setState(() {
        selectedTeamId = item.TEAM_ID;
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
