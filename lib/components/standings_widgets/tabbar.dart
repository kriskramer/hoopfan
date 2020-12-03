import 'package:flutter/material.dart';
import 'package:hoop/components/standings_widgets/table.dart';
import 'package:hoop/components/standings_widgets/table_div.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';

class Bar extends StatelessWidget {
  final dynamic eastTable;
  final dynamic westTable;
  final dynamic southwestTable;
  final dynamic southeastTable;
  final dynamic northwestTable;
  final dynamic centralTable;
  final dynamic atlanticTable;
  final dynamic pacificTable;
  Bar(
      {this.eastTable,
      this.westTable,
      this.southeastTable,
      this.southwestTable,
      this.northwestTable,
      this.centralTable,
      this.atlanticTable,
      this.pacificTable});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                'Eastern Conference',
                style: TextStyle(fontSize: 18),
              ),
              ConfTable(json: eastTable, teamIds: eastID),
              SizedBox(
                height: 30,
              ),
              Text(
                'Western Conference',
                style: TextStyle(fontSize: 18),
              ),
              ConfTable(json: westTable, teamIds: westID),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                'Atlantic Division',
                style: TextStyle(fontSize: 18),
              ),
              DivTable(
                  json: Provider.of<JsonFiles>(context).getAtlanticStandings(),
                  teamIds: atlanticId),
              SizedBox(
                height: 20,
              ),
              Text(
                'Central Division',
                style: TextStyle(fontSize: 18),
              ),
              DivTable(
                  json: Provider.of<JsonFiles>(context).getCentralStandings(),
                  teamIds: centralId),
              SizedBox(
                height: 20,
              ),
              Text(
                'Southeast Division',
                style: TextStyle(fontSize: 18),
              ),
              DivTable(
                  json: Provider.of<JsonFiles>(context).getSoutheastStandings(),
                  teamIds: southeastId),
              SizedBox(
                height: 20,
              ),
              Text(
                'Northwest Division',
                style: TextStyle(fontSize: 18),
              ),
              DivTable(
                  json: Provider.of<JsonFiles>(context).getNorthwestStandings(),
                  teamIds: northwestId),
              SizedBox(
                height: 20,
              ),
              Text(
                'Pacific Division',
                style: TextStyle(fontSize: 18),
              ),
              DivTable(
                  json: Provider.of<JsonFiles>(context).getPacificStandings(),
                  teamIds: pacificId),
              SizedBox(
                height: 20,
              ),
              Text(
                'Southwest Division',
                style: TextStyle(fontSize: 18),
              ),
              DivTable(
                  json: Provider.of<JsonFiles>(context).getSouthwestStandings(),
                  teamIds: southwestId),
            ],
          ),
        )
      ],
    );
  }
}
