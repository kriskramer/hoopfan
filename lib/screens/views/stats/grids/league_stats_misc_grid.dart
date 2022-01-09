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
  int selectedTeamId = 0;

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
    int counter = 1;
    for (var i in stats.items) {
      list.add(getMiscDataRow(i, counter));
      counter++;
    }
    return list;
  }

  DataRow getMiscDataRow(MiscStatsLeague item, int index) {
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
          getDataCell(item.PTS_OFF_TOV.toString(), item.PTS_OFF_TOV_RANK, item),
          getDataCell(
              item.PTS_2ND_CHANCE.toString(), item.PTS_2ND_CHANCE_RANK, item),
          getDataCell(item.PTS_FB.toString(), item.PTS_FB_RANK, item),
          getDataCell(item.PTS_PAINT.toString(), item.PTS_PAINT_RANK, item),
          getDataCell(
              item.OPP_PTS_OFF_TOV.toString(), item.OPP_PTS_OFF_TOV_RANK, item),
          getDataCell(item.OPP_PTS_2ND_CHANCE.toString(),
              item.OPP_PTS_2ND_CHANCE_RANK, item),
          getDataCell(item.OPP_PTS_FB.toString(), item.OPP_PTS_FB_RANK, item),
          getDataCell(
              item.OPP_PTS_PAINT.toString(), item.OPP_PTS_PAINT_RANK, item),
          getDataCell(item.GP_RANK.toString(), item.GP_RANK, item),
          getDataCell(item.W_RANK.toString(), item.W_RANK, item),
          getDataCell(item.L_RANK.toString(), item.L_RANK, item),
          getDataCell(item.W_PCT_RANK.toString(), item.W_PCT_RANK, item),
          getDataCell(item.MIN_RANK.toString(), item.MIN_RANK, item),
          getDataCell(
              item.PTS_OFF_TOV_RANK.toString(), item.PTS_OFF_TOV_RANK, item),
          getDataCell(item.PTS_2ND_CHANCE_RANK.toString(),
              item.PTS_2ND_CHANCE_RANK, item),
          getDataCell(item.PTS_FB_RANK.toString(), item.PTS_FB_RANK, item),
          getDataCell(
              item.PTS_PAINT_RANK.toString(), item.PTS_PAINT_RANK, item),
          getDataCell(item.OPP_PTS_OFF_TOV_RANK.toString(),
              item.OPP_PTS_OFF_TOV_RANK, item),
          getDataCell(item.OPP_PTS_2ND_CHANCE_RANK.toString(),
              item.OPP_PTS_2ND_CHANCE_RANK, item),
          getDataCell(
              item.OPP_PTS_FB_RANK.toString(), item.OPP_PTS_FB_RANK, item),
          getDataCell(item.OPP_PTS_PAINT_RANK.toString(),
              item.OPP_PTS_PAINT_RANK, item),
        ]);
  }

  List<DataColumn> getMiscDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('')));
    list.add(DataColumn(label: Text('TEAM NAME'), onSort: sortFunction));
    list.add(DataColumn(label: Text('GP'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W'), onSort: sortFunction));
    list.add(DataColumn(label: Text('L'), onSort: sortFunction));
    list.add(DataColumn(label: Text('W %'), onSort: sortFunction));
    list.add(DataColumn(label: Text('MIN'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PTS OFF TOV'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PTS 2ND CHANCE'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PTS FB'), onSort: sortFunction));
    list.add(DataColumn(label: Text('PTS PAINT'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP PTS OFF TOV'), onSort: sortFunction));
    list.add(
        DataColumn(label: Text('OPP PTS 2ND CHANCE'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP PTS FB'), onSort: sortFunction));
    list.add(DataColumn(label: Text('OPP PTS PAINT'), onSort: sortFunction));
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

    return list;
  }

  void doSort(MiscStatsLeagueList stats) {
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
      stats.sortPtsOffTov(sort);
    }
    if (colIndex == 8) {
      stats.sortPts2ndChance(sort);
    }
    if (colIndex == 9) {
      stats.sortPtsFb(sort);
    }
    if (colIndex == 10) {
      stats.sortPtsPaint(sort);
    }
    if (colIndex == 11) {
      stats.sortOppPtsOffTov(sort);
    }
    if (colIndex == 12) {
      stats.sortOppPts2ndChance(sort);
    }
    if (colIndex == 13) {
      stats.sortOppPtsFb(sort);
    }
    if (colIndex == 14) {
      stats.sortOppPtsPaint(sort);
    }
  }

  DataCell getDataCell(String value, int rank, MiscStatsLeague item) {
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
