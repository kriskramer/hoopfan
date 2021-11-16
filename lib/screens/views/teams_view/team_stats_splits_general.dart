import 'package:flutter/material.dart';

class TeamStatsSplitsGeneral extends StatelessWidget {
  final dynamic stats;

  const TeamStatsSplitsGeneral({this.stats});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            'General Splits',
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
            'Location Splits',
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
            'W/L Splits',
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
            'Month Splits',
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
            'All Star Splits',
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
            'Days Rest Splits',
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
        ],
      ),
    );
  }

  List<DataRow> getVariableRows(dynamic stats, int typeNum) {
    List<DataRow> list = [];
    for (var i = 0; i < stats["resultSets"][typeNum]["rowSet"].length; i++) {
      list.add(getDataRow(stats, typeNum, i));
    }
    return list;
  }

  DataRow getDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
      getDataCell(stats, typeNum, setNum, 0),
      getDataCell(stats, typeNum, setNum, 1),
      //getDataCell(stats, typeNum, setNum, 2),
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
      getDataCell(stats, typeNum, setNum, 16),
      getDataCell(stats, typeNum, setNum, 17),
      getDataCell(stats, typeNum, setNum, 18),
      getDataCell(stats, typeNum, setNum, 19),
      getDataCell(stats, typeNum, setNum, 20),
      getDataCell(stats, typeNum, setNum, 21),
      getDataCell(stats, typeNum, setNum, 22),
      getDataCell(stats, typeNum, setNum, 23),
      getDataCell(stats, typeNum, setNum, 24),
      getDataCell(stats, typeNum, setNum, 25),
      getDataCell(stats, typeNum, setNum, 26),
      getDataCell(stats, typeNum, setNum, 27),
      getDataCell(stats, typeNum, setNum, 28),
    ]);
  }

  DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum) {
    if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    return DataCell(Text(
        stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString()));
  }

  List<DataColumn> getBaseDataColumns() {
    List<DataColumn> list = [];

    list.add(DataColumn(label: Text('Group')));
    list.add(DataColumn(label: Text('Value')));
    //list.add(DataColumn(label: Text('Year')),
    list.add(DataColumn(label: Text('GP')));
    list.add(DataColumn(label: Text('W')));
    list.add(DataColumn(label: Text('L')));
    list.add(DataColumn(label: Text('W %')));
    list.add(DataColumn(label: Text('Min')));
    list.add(DataColumn(label: Text('FGM')));
    list.add(DataColumn(label: Text('FGA')));
    list.add(DataColumn(label: Text('FG %')));
    list.add(DataColumn(label: Text('3PM')));
    list.add(DataColumn(label: Text('3PA')));
    list.add(DataColumn(label: Text('3P %')));
    list.add(DataColumn(label: Text('FTM')));
    list.add(DataColumn(label: Text('FTA')));
    list.add(DataColumn(label: Text('FT %')));
    list.add(DataColumn(label: Text('OREB')));
    list.add(DataColumn(label: Text('DREB')));
    list.add(DataColumn(label: Text('REB')));
    list.add(DataColumn(label: Text('AST')));
    list.add(DataColumn(label: Text('TOV')));
    list.add(DataColumn(label: Text('STL')));
    list.add(DataColumn(label: Text('BLK')));
    list.add(DataColumn(label: Text('BLKA')));
    list.add(DataColumn(label: Text('PF')));
    list.add(DataColumn(label: Text('PFD')));
    list.add(DataColumn(label: Text('PTS')));
    list.add(DataColumn(label: Text('+/-')));

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
        columns: [...getBaseDataColumns()],
        rows: [
          // The number of rows here is dynamic, based on the actual number of months the season currently ha
          ...getVariableRows(stats, typeNum),
        ],
      ),
    );
  }
}
