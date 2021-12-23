import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/base_stats_league.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class LeagueStatsBaseGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsBaseGrid(this.stats);

  @override
  State<LeagueStatsBaseGrid> createState() => _LeagueStatsBaseGridState();
}

class _LeagueStatsBaseGridState extends State<LeagueStatsBaseGrid> {
  bool sort = true;
  int colIndex = 0;

  @override
  Widget build(BuildContext context) {
    BaseStatsLeagueList baseStats = BaseStatsLeagueList(widget.stats);

    doBaseSort(baseStats);

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
        columns: [...getBaseDataColumns()],
        rows: [...getVariableBaseRows(baseStats)],
      ),
    );
  }

  List<DataRow> getVariableBaseRows(BaseStatsLeagueList stats) {
    List<DataRow> list = [];
    for (var i in stats.items) {
      list.add(getBaseDataRow(i));
    }
    return list;
  }

  DataRow getBaseDataRow(BaseStatsLeague item) {
    return DataRow(cells: [
      //DataCell(Text(item.TEAM_ID.toString())),
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

  List<DataColumn> getBaseDataColumns() {
    List<DataColumn> list = [];
    //list.add(DataColumn(label: Text('TEAM_ID')));
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
        label: Text('FGM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FGA'),
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
        label: Text('FG3M'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FG3A'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FG3 %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FTM'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FTA'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('FT %'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OREB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('DREB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('REB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('AST'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('TOV'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('STL'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('BLK'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('BLKA'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PF'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PFD'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PTS'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('+/-'),
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
    list.add(DataColumn(label: Text('FGM RANK')));
    list.add(DataColumn(label: Text('FGA RANK')));
    list.add(DataColumn(label: Text('FG % RANK')));
    list.add(DataColumn(label: Text('FG3M RANK')));
    list.add(DataColumn(label: Text('FG3A RANK')));
    list.add(DataColumn(label: Text('FG3 % RANK')));
    list.add(DataColumn(label: Text('FTM RANK')));
    list.add(DataColumn(label: Text('FTA RANK')));
    list.add(DataColumn(label: Text('FT % RANK')));
    list.add(DataColumn(label: Text('OREB RANK')));
    list.add(DataColumn(label: Text('DREB RANK')));
    list.add(DataColumn(label: Text('REB RANK')));
    list.add(DataColumn(label: Text('AST RANK')));
    list.add(DataColumn(label: Text('TOV RANK')));
    list.add(DataColumn(label: Text('STL RANK')));
    list.add(DataColumn(label: Text('BLK RANK')));
    list.add(DataColumn(label: Text('BLKA RANK')));
    list.add(DataColumn(label: Text('PF RANK')));
    list.add(DataColumn(label: Text('PFD RANK')));
    list.add(DataColumn(label: Text('PTS RANK')));
    list.add(DataColumn(label: Text('+/- RANK')));

    return list;
  }

  void doBaseSort(BaseStatsLeagueList stats) {
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
        stats.sortFGM(false);
      } else {
        stats.sortFGM(true);
      }
    }
    if (colIndex == 7) {
      if (sort) {
        stats.sortFGA(false);
      } else {
        stats.sortFGA(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        stats.sortFGPCT(false);
      } else {
        stats.sortFGPCT(true);
      }
    }
    if (colIndex == 9) {
      if (sort) {
        stats.sortFG3M(false);
      } else {
        stats.sortFG3M(true);
      }
    }
    if (colIndex == 10) {
      if (sort) {
        stats.sortFG3A(false);
      } else {
        stats.sortFG3A(true);
      }
    }
    if (colIndex == 11) {
      if (sort) {
        stats.sortFG3PCT(false);
      } else {
        stats.sortFG3PCT(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        stats.sortFTM(false);
      } else {
        stats.sortFTM(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        stats.sortFTA(false);
      } else {
        stats.sortFTA(true);
      }
    }
    if (colIndex == 14) {
      if (sort) {
        stats.sortFTPCT(false);
      } else {
        stats.sortFTPCT(true);
      }
    }
    if (colIndex == 15) {
      if (sort) {
        stats.sortOREB(false);
      } else {
        stats.sortOREB(true);
      }
    }
    if (colIndex == 16) {
      if (sort) {
        stats.sortDREB(false);
      } else {
        stats.sortDREB(true);
      }
    }
    if (colIndex == 17) {
      if (sort) {
        stats.sortREB(false);
      } else {
        stats.sortREB(true);
      }
    }
    if (colIndex == 18) {
      if (sort) {
        stats.sortAST(false);
      } else {
        stats.sortAST(true);
      }
    }
    if (colIndex == 19) {
      if (sort) {
        stats.sortTOV(false);
      } else {
        stats.sortTOV(true);
      }
    }
    if (colIndex == 20) {
      if (sort) {
        stats.sortSTL(false);
      } else {
        stats.sortSTL(true);
      }
    }
    if (colIndex == 21) {
      if (sort) {
        stats.sortBLK(false);
      } else {
        stats.sortBLK(true);
      }
    }
    if (colIndex == 22) {
      if (sort) {
        stats.sortBLKA(false);
      } else {
        stats.sortBLKA(true);
      }
    }
    if (colIndex == 23) {
      if (sort) {
        stats.sortPF(false);
      } else {
        stats.sortPF(true);
      }
    }
    if (colIndex == 24) {
      if (sort) {
        stats.sortPFD(false);
      } else {
        stats.sortPFD(true);
      }
    }
    if (colIndex == 25) {
      if (sort) {
        stats.sortPTS(false);
      } else {
        stats.sortPTS(true);
      }
    }
    if (colIndex == 26) {
      if (sort) {
        stats.sortPLUSMINUS(false);
      } else {
        stats.sortPLUSMINUS(true);
      }
    }
  }
}
