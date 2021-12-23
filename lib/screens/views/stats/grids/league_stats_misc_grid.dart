import 'package:flutter/material.dart';
import 'package:hoop/models/league_stats/misc_stats_league.dart';
import 'package:hoop/screens/views/teams/team_main.dart';

class LeagueStatsMiscGrid extends StatefulWidget {
  final dynamic stats;
  const LeagueStatsMiscGrid(this.stats);

  @override
  _LeagueStatsMiscGridState createState() => _LeagueStatsMiscGridState();
}

class _LeagueStatsMiscGridState extends State<LeagueStatsMiscGrid> {
  bool sort = true;
  int colIndex = 0;

  @override
  Widget build(BuildContext context) {
    MiscStatsLeagueList miscStats = MiscStatsLeagueList(widget.stats);

    doSort(miscStats);

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
        columns: [...getMiscDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableMiscRows(miscStats),
        ],
      ),
    );
  }

  List<DataRow> getVariableMiscRows(dynamic stats) {
    List<DataRow> list = [];
    for (var i in stats.items) {
      list.add(getMiscDataRow(i));
    }
    return list;
  }

  DataRow getMiscDataRow(MiscStatsLeague item) {
    return DataRow(cells: [
      //DataCell(Text(item.TEAM_ID)),
      DataCell(GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TeamDetails(nbaTeamId: item.TEAM_ID.toString());
                });
          },
          child: Text(item.TEAM_NAME))),
      DataCell(Text(item.TEAM_NAME)),
      DataCell(Text(item.GP.toString())),
      DataCell(Text(item.W.toString())),
      DataCell(Text(item.L.toString())),
      DataCell(Text(item.W_PCT.toString())),
      DataCell(Text(item.MIN.toString())),
      DataCell(Text(item.PTS_OFF_TOV.toString())),
      DataCell(Text(item.PTS_2ND_CHANCE.toString())),
      DataCell(Text(item.PTS_FB.toString())),
      DataCell(Text(item.PTS_PAINT.toString())),
      DataCell(Text(item.OPP_PTS_OFF_TOV.toString())),
      DataCell(Text(item.OPP_PTS_2ND_CHANCE.toString())),
      DataCell(Text(item.OPP_PTS_FB.toString())),
      DataCell(Text(item.OPP_PTS_PAINT.toString())),
      DataCell(Text(item.GP_RANK.toString())),
      DataCell(Text(item.W_RANK.toString())),
      DataCell(Text(item.L_RANK.toString())),
      DataCell(Text(item.W_PCT_RANK.toString())),
      DataCell(Text(item.MIN_RANK.toString())),
      DataCell(Text(item.PTS_OFF_TOV_RANK.toString())),
      DataCell(Text(item.PTS_2ND_CHANCE_RANK.toString())),
      DataCell(Text(item.PTS_FB_RANK.toString())),
      DataCell(Text(item.PTS_PAINT_RANK.toString())),
      DataCell(Text(item.OPP_PTS_OFF_TOV_RANK.toString())),
      DataCell(Text(item.OPP_PTS_2ND_CHANCE_RANK.toString())),
      DataCell(Text(item.OPP_PTS_FB_RANK.toString())),
      DataCell(Text(item.OPP_PTS_PAINT_RANK.toString())),
      //DataCell(Text(item.CFID)),
      //DataCell(Text(item.CFPARAMS)),
    ]);
  }

  List<DataColumn> getMiscDataColumns() {
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
        label: Text('PTS OFF TOV'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PTS 2ND CHANCE'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PTS FB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('PTS PAINT'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PTS OFF TOV'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PTS 2ND CHANCE'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PTS FB'),
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            colIndex = columnIndex;
          });
        }));
    list.add(DataColumn(
        label: Text('OPP PTS PAINT'),
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
    list.add(DataColumn(label: Text('PTS OFF TOV RANK')));
    list.add(DataColumn(label: Text('PTS 2ND CHANCE RANK')));
    list.add(DataColumn(label: Text('PTS FB RANK')));
    list.add(DataColumn(label: Text('PTS PAINT RANK')));
    list.add(DataColumn(label: Text('OPP PTS OFF TOV RANK')));
    list.add(DataColumn(label: Text('OPP PTS 2ND CHANCE RANK')));
    list.add(DataColumn(label: Text('OPP PTS FB RANK')));
    list.add(DataColumn(label: Text('OPP PTS PAINT RANK')));
    // list.add(DataColumn(label: Text('CFID')));
    // list.add(DataColumn(label: Text('CFPARAMS')));

    return list;
  }

  void doSort(MiscStatsLeagueList stats) {
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
        stats.sortPtsOffTov(false);
      } else {
        stats.sortPtsOffTov(true);
      }
    }
    if (colIndex == 7) {
      if (sort) {
        stats.sortPts2ndChance(false);
      } else {
        stats.sortPts2ndChance(true);
      }
    }
    if (colIndex == 8) {
      if (sort) {
        stats.sortPtsFb(false);
      } else {
        stats.sortPtsFb(true);
      }
    }
    if (colIndex == 9) {
      if (sort) {
        stats.sortPtsPaint(false);
      } else {
        stats.sortPtsPaint(true);
      }
    }
    if (colIndex == 10) {
      if (sort) {
        stats.sortOppPtsOffTov(false);
      } else {
        stats.sortOppPtsOffTov(true);
      }
    }
    if (colIndex == 11) {
      if (sort) {
        stats.sortOppPts2ndChance(false);
      } else {
        stats.sortOppPts2ndChance(true);
      }
    }
    if (colIndex == 12) {
      if (sort) {
        stats.sortOppPtsFb(false);
      } else {
        stats.sortOppPtsFb(true);
      }
    }
    if (colIndex == 13) {
      if (sort) {
        stats.sortOppPtsPaint(false);
      } else {
        stats.sortOppPtsPaint(true);
      }
    }
  }
}
