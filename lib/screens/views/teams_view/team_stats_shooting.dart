import 'package:flutter/material.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';

class TeamStatsShootingView extends StatefulWidget {
  final String teamId;

  TeamStatsShootingView({this.teamId});

  @override
  _TeamStatsShootingViewState createState() => _TeamStatsShootingViewState();
}

class _TeamStatsShootingViewState extends State<TeamStatsShootingView> {
  @override
  Widget build(BuildContext context) {
    dynamic stats = Provider.of<JsonFiles>(context, listen: false)
        .getTeamStatsShooting(widget.teamId);

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'General Shooting',
            style: TextStyle(fontSize: 20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 15,
              headingRowHeight: 25,
              dataRowHeight: 25,
              headingTextStyle: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.grey[300];
              }),
              columns: [
                DataColumn(label: Text('Shot Type')),
                DataColumn(label: Text('FGA Freq')),
                DataColumn(label: Text('FGM')),
                DataColumn(label: Text('FGA')),
                DataColumn(label: Text('FG %')),
                DataColumn(label: Text('eFG %')),
                DataColumn(label: Text('2P Freq')),
                DataColumn(label: Text('2PM')),
                DataColumn(label: Text('2PA')),
                DataColumn(label: Text('2P %')),
                DataColumn(label: Text('3P Freq')),
                DataColumn(label: Text('3PM')),
                DataColumn(label: Text('3PA')),
                DataColumn(label: Text('3P %')),
              ],
              rows: [
                getDataRow(stats, 0, 0),
                getDataRow(stats, 0, 1),
                getDataRow(stats, 0, 2),
                getDataRow(stats, 0, 3),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Shot Clock Shooting',
            style: TextStyle(fontSize: 20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 15,
              headingRowHeight: 25,
              dataRowHeight: 25,
              headingTextStyle: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.grey[300];
              }),
              columns: [
                DataColumn(label: Text('Shot Clock Range')),
                DataColumn(label: Text('FGA Freq')),
                DataColumn(label: Text('FGM')),
                DataColumn(label: Text('FGA')),
                DataColumn(label: Text('FG %')),
                DataColumn(label: Text('eFG %')),
                DataColumn(label: Text('2P Freq')),
                DataColumn(label: Text('2PM')),
                DataColumn(label: Text('2PA')),
                DataColumn(label: Text('2P %')),
                DataColumn(label: Text('3P Freq')),
                DataColumn(label: Text('3PM')),
                DataColumn(label: Text('3PA')),
                DataColumn(label: Text('3P %')),
              ],
              rows: [
                getDataRow(stats, 1, 0),
                getDataRow(stats, 1, 1),
                getDataRow(stats, 1, 2),
                getDataRow(stats, 1, 3),
                getDataRow(stats, 1, 4),
                getDataRow(stats, 1, 5),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Dribble Shooting',
            style: TextStyle(fontSize: 20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 15,
              headingRowHeight: 25,
              dataRowHeight: 25,
              headingTextStyle: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.grey[300];
              }),
              columns: [
                DataColumn(label: Text('Dribble Range')),
                DataColumn(label: Text('FGA Freq')),
                DataColumn(label: Text('FGM')),
                DataColumn(label: Text('FGA')),
                DataColumn(label: Text('FG %')),
                DataColumn(label: Text('eFG %')),
                DataColumn(label: Text('2P Freq')),
                DataColumn(label: Text('2PM')),
                DataColumn(label: Text('2PA')),
                DataColumn(label: Text('2P %')),
                DataColumn(label: Text('3P Freq')),
                DataColumn(label: Text('3PM')),
                DataColumn(label: Text('3PA')),
                DataColumn(label: Text('3P %')),
              ],
              rows: [
                getDataRow(stats, 2, 0),
                getDataRow(stats, 2, 1),
                getDataRow(stats, 2, 2),
                getDataRow(stats, 2, 3),
                getDataRow(stats, 2, 4),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Closest Defender Shooting',
            style: TextStyle(fontSize: 20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 15,
              headingRowHeight: 25,
              dataRowHeight: 25,
              headingTextStyle: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.grey[300];
              }),
              columns: [
                DataColumn(label: Text('Def Dist')),
                DataColumn(label: Text('FGA Freq')),
                DataColumn(label: Text('FGM')),
                DataColumn(label: Text('FGA')),
                DataColumn(label: Text('FG %')),
                DataColumn(label: Text('eFG %')),
                DataColumn(label: Text('2P Freq')),
                DataColumn(label: Text('2PM')),
                DataColumn(label: Text('2PA')),
                DataColumn(label: Text('2P %')),
                DataColumn(label: Text('3P Freq')),
                DataColumn(label: Text('3PM')),
                DataColumn(label: Text('3PA')),
                DataColumn(label: Text('3P %')),
              ],
              rows: [
                getDataRow(stats, 3, 0),
                getDataRow(stats, 3, 1),
                getDataRow(stats, 3, 2),
                getDataRow(stats, 3, 3),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Touch Time Shooting',
            style: TextStyle(fontSize: 18),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 15,
              headingRowHeight: 25,
              dataRowHeight: 25,
              headingTextStyle: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.grey[300];
              }),
              columns: [
                DataColumn(label: Text('Touch Time Range')),
                DataColumn(label: Text('FGA Freq')),
                DataColumn(label: Text('FGM')),
                DataColumn(label: Text('FGA')),
                DataColumn(label: Text('FG %')),
                DataColumn(label: Text('eFG %')),
                DataColumn(label: Text('2P Freq')),
                DataColumn(label: Text('2PM')),
                DataColumn(label: Text('2PA')),
                DataColumn(label: Text('2P %')),
                DataColumn(label: Text('3P Freq')),
                DataColumn(label: Text('3PM')),
                DataColumn(label: Text('3PA')),
                DataColumn(label: Text('3P %')),
              ],
              rows: [
                getDataRow(stats, 5, 0),
                getDataRow(stats, 5, 1),
                getDataRow(stats, 5, 2),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  DataRow getDataRow(dynamic stats, int typeNum, int setNum) {
    return DataRow(cells: [
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
    ]);
  }

  DataCell getDataCell(dynamic stats, int typeNum, int setNum, int valueNum) {
    if (stats["resultSets"][typeNum]["rowSet"].length == 0) {
      return DataCell(Text('0.0'));
    }

    return DataCell(Text(
        stats["resultSets"][typeNum]["rowSet"][setNum][valueNum].toString()));
  }
}
