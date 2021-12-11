import 'package:flutter/material.dart';
import 'package:hoop/components/helper_widgets/stat_info_dialog.dart';

class TeamStatsSplitsShooting extends StatelessWidget {
  final dynamic stats;

  const TeamStatsSplitsShooting({this.stats});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            'Shooting Splits',
            style: TextStyle(fontSize: 20),
          ),
          getDataGrid(stats, 0),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Shooting Distance (5ft)',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 1),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Shooting Distance (8ft)',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 2),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Shot Area',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 3),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Assisted',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 4),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Shot Type',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 5),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
          Text(
            'Splits By Assisted By',
            style: TextStyle(fontSize: 20),
          ),

          getDataGrid(stats, 6),
          SizedBox(
            height: 10,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 TeamStatsShootingGeneralCharts([stats]),
          //           ));
          //     },
          //     child: Text("Charts")),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  List<DataRow> getVariableShootingRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getShootingDataRow(stats, typeNum, i));
    }
    return list;
  }

  DataRow getShootingDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      getDataCell(stats, typeNum, setNum, 2),
      getDataCell(stats, typeNum, setNum, 3),
      getDataCell(stats, typeNum, setNum, 4),
      getDataCell(stats, typeNum, setNum, 5),
      getDataCell(stats, typeNum, setNum, 6),
      getDataCell(stats, typeNum, setNum, 7),
      getDataCell(stats, typeNum, setNum, 8),
      getDataCell(stats, typeNum, setNum, 9),
      getDataCell(stats, typeNum, setNum, 10),
      getDataCell(stats, typeNum, setNum, 11),
      getDataCell(stats, typeNum, setNum, 12),
      getDataCell(stats, typeNum, setNum, 13),
      getDataCell(stats, typeNum, setNum, 14),
      getDataCell(stats, typeNum, setNum, 15),
    ]);
  }

  DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum) {
    if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    return DataCell(Text(
        stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString()));
  }

  List<DataColumn> getShootingDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FGM'), statName: "FGM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('FGA'), statName: "FGA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('FG %'), statName: "FG %")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('3PM'), statName: "3PM")));
    list.add(
        DataColumn(label: StatInfoDialog(label: Text('3PA'), statName: "3PA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('3P %'), statName: "3P %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('eFG %'), statName: "eFG %")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('BLKA'), statName: "BLKA")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Ast 2P'), statName: "% Ast 2P")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% UAst 2P'), statName: "% UAst 2P")));
    list.add(DataColumn(
        label: StatInfoDialog(label: Text('% Ast 3P'), statName: "% Ast 3P")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% UAst 3P'), statName: "% UAst 3P")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% Ast FGM'), statName: "% Ast FGM")));
    list.add(DataColumn(
        label:
            StatInfoDialog(label: Text('% UAst FGM'), statName: "% UAst FGM")));

    return list;
  }

  Widget getDataGrid(dynamic stats, int typeNum) {
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
        columns: [...getShootingDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableShootingRows(stats, typeNum),
        ],
      ),
    );
  }
}
