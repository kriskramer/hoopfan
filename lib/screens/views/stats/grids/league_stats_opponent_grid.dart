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
      DataCell(Text(item.FGM.toString())),
      DataCell(Text(item.FGA.toString())),
      DataCell(Text(item.FG_PCT.toString())),
      DataCell(Text(item.FG3M.toString())),
      DataCell(Text(item.FG3A.toString())),
      DataCell(Text(item.FG3_PCT.toString())),
      DataCell(Text(item.FTM.toString())),
      DataCell(Text(item.FTA.toString())),
      DataCell(Text(item.FT_PCT.toString())),
      DataCell(Text(item.OREB.toString())),
      DataCell(Text(item.DREB.toString())),
      DataCell(Text(item.REB.toString())),
      DataCell(Text(item.AST.toString())),
      DataCell(Text(item.TOV.toString())),
      DataCell(Text(item.STL.toString())),
      DataCell(Text(item.BLK.toString())),
      DataCell(Text(item.BLKA.toString())),
      DataCell(Text(item.PF.toString())),
      DataCell(Text(item.PFD.toString())),
      DataCell(Text(item.PTS.toString())),
      DataCell(Text(item.PLUS_MINUS.toString())),
      DataCell(Text(item.GP_RANK.toString())),
      DataCell(Text(item.W_RANK.toString())),
      DataCell(Text(item.L_RANK.toString())),
      DataCell(Text(item.W_PCT_RANK.toString())),
      DataCell(Text(item.MIN_RANK.toString())),
      DataCell(Text(item.FGM_RANK.toString())),
      DataCell(Text(item.FGA_RANK.toString())),
      DataCell(Text(item.FG_PCT_RANK.toString())),
      DataCell(Text(item.FG3M_RANK.toString())),
      DataCell(Text(item.FG3A_RANK.toString())),
      DataCell(Text(item.FG3_PCT_RANK.toString())),
      DataCell(Text(item.FTM_RANK.toString())),
      DataCell(Text(item.FTA_RANK.toString())),
      DataCell(Text(item.FT_PCT_RANK.toString())),
      DataCell(Text(item.OREB_RANK.toString())),
      DataCell(Text(item.DREB_RANK.toString())),
      DataCell(Text(item.REB_RANK.toString())),
      DataCell(Text(item.AST_RANK.toString())),
      DataCell(Text(item.TOV_RANK.toString())),
      DataCell(Text(item.STL_RANK.toString())),
      DataCell(Text(item.BLK_RANK.toString())),
      DataCell(Text(item.BLKA_RANK.toString())),
      DataCell(Text(item.PF_RANK.toString())),
      DataCell(Text(item.PFD_RANK.toString())),
      DataCell(Text(item.PTS_RANK.toString())),
      DataCell(Text(item.PLUS_MINUS_RANK.toString())),
    ]);
  }

  List<DataColumn> getOpponentDataColumns() {
    List<DataColumn> list = [];
    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(
        label: Text('Team'),
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
        label: Text('OPP FGM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FGA'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FG %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FG3M'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FG3A'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FG3 %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FTM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FTA'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP FT %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP OREB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP DREB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP REB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP AST'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP TOV'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP STL'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP BLK'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP BLKA'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PF'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PFD'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PTS'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP +/-'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(label: Text('OPP GP RANK')));
    list.add(DataColumn(label: Text('OPP W RANK')));
    list.add(DataColumn(label: Text('OPP L RANK')));
    list.add(DataColumn(label: Text('OPP W % RANK')));
    list.add(DataColumn(label: Text('OPP MIN RANK')));
    list.add(DataColumn(label: Text('OPP FGM RANK')));
    list.add(DataColumn(label: Text('OPP FGA RANK')));
    list.add(DataColumn(label: Text('OPP FG % RANK')));
    list.add(DataColumn(label: Text('OPP FG3M RANK')));
    list.add(DataColumn(label: Text('OPP FG3A RANK')));
    list.add(DataColumn(label: Text('OPP FG3 % RANK')));
    list.add(DataColumn(label: Text('OPP FTM RANK')));
    list.add(DataColumn(label: Text('OPP FTA RANK')));
    list.add(DataColumn(label: Text('OPP FT % RANK')));
    list.add(DataColumn(label: Text('OPP OREB RANK')));
    list.add(DataColumn(label: Text('OPP DREB RANK')));
    list.add(DataColumn(label: Text('OPP REB RANK')));
    list.add(DataColumn(label: Text('OPP AST RANK')));
    list.add(DataColumn(label: Text('OPP TOV RANK')));
    list.add(DataColumn(label: Text('OPP STL RANK')));
    list.add(DataColumn(label: Text('OPP BLK RANK')));
    list.add(DataColumn(label: Text('OPP BLKA RANK')));
    list.add(DataColumn(label: Text('OPP PF RANK')));
    list.add(DataColumn(label: Text('OPP PFD RANK')));
    list.add(DataColumn(label: Text('OPP PTS RANK')));
    list.add(DataColumn(label: Text('OPP +/- RANK')));

    return list;
  }

  void doOpponentSort(OpponentStatsLeagueList stats) {
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
        stats.sortFGM(false);
      } else {
        stats.sortFGM(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        stats.sortFGA(false);
      } else {
        stats.sortFGA(true);
      }
    }
    if (colIndex == 9) {
      if (sort) {
        stats.sortFGPCT(false);
      } else {
        stats.sortFGPCT(true);
      }
    }
    if (colIndex == 10) {
      if (sort) {
        stats.sortFG3M(false);
      } else {
        stats.sortFG3M(true);
      }
    }
    if (colIndex == 11) {
      if (sort) {
        stats.sortFG3A(false);
      } else {
        stats.sortFG3A(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        stats.sortFG3PCT(false);
      } else {
        stats.sortFG3PCT(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        stats.sortFTM(false);
      } else {
        stats.sortFTM(true);
      }
    }
    if (colIndex == 14) {
      if (sort) {
        stats.sortFTA(false);
      } else {
        stats.sortFTA(true);
      }
    }
    if (colIndex == 15) {
      if (sort) {
        stats.sortFTPCT(false);
      } else {
        stats.sortFTPCT(true);
      }
    }
    if (colIndex == 16) {
      if (sort) {
        stats.sortOREB(false);
      } else {
        stats.sortOREB(true);
      }
    }
    if (colIndex == 17) {
      if (sort) {
        stats.sortDREB(false);
      } else {
        stats.sortDREB(true);
      }
    }
    if (colIndex == 18) {
      if (sort) {
        stats.sortREB(false);
      } else {
        stats.sortREB(true);
      }
    }
    if (colIndex == 19) {
      if (sort) {
        stats.sortAST(false);
      } else {
        stats.sortAST(true);
      }
    }
    if (colIndex == 20) {
      if (sort) {
        stats.sortTOV(false);
      } else {
        stats.sortTOV(true);
      }
    }
    if (colIndex == 21) {
      if (sort) {
        stats.sortSTL(false);
      } else {
        stats.sortSTL(true);
      }
    }
    if (colIndex == 22) {
      if (sort) {
        stats.sortBLK(false);
      } else {
        stats.sortBLK(true);
      }
    }
    if (colIndex == 23) {
      if (sort) {
        stats.sortBLKA(false);
      } else {
        stats.sortBLKA(true);
      }
    }
    if (colIndex == 24) {
      if (sort) {
        stats.sortPF(false);
      } else {
        stats.sortPF(true);
      }
    }
    if (colIndex == 25) {
      if (sort) {
        stats.sortPFD(false);
      } else {
        stats.sortPFD(true);
      }
    }
    if (colIndex == 26) {
      if (sort) {
        stats.sortPTS(false);
      } else {
        stats.sortPTS(true);
      }
    }
    if (colIndex == 27) {
      if (sort) {
        stats.sortPLUSMINUS(false);
      } else {
        stats.sortPLUSMINUS(true);
      }
    }
  }
}
