import 'package:flutter/material.dart';
import 'package:hoop/config.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:xml/xml.dart';

class InjuryReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<InjuryReportItem> list = List<InjuryReportItem>();
              List<Widget> rows = List<Widget>();

              var xml = XmlDocument.parse(snapshot.data);

              var teams = xml.lastChild.findAllElements('Team');

              for (var x in teams) {
                for (var p in x.children) {
                  list.add(InjuryReportItem(
                      name: p.getElement('name').innerText,
                      injury: p.getElement('injury').innerText,
                      notes: p.getElement('notes').innerText,
                      updated: p.getElement('updated').innerText,
                      team: x.getAttribute('code').toString()));
                }
              }

              print(list.length);
              var team = '';

              for (var l in list) {
                if (l.team != team) {
                  rows.add(SizedBox(
                    height: 15,
                  ));
                  team = l.team;
                }
                rows.add(Row(
                  children: [
                    Text(
                      l.team,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      l.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
                rows.add(Row(
                  children: [
                    Text(l.injury + ' - ' + l.notes),
                  ],
                ));
                rows.add(SizedBox(
                  height: 5,
                ));
              }

              return Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Injury Report',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ...rows
                    ],
                  ),
                ),
              );
            } else
              return Container(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    'No Current Injury Data',
                    style: TextStyle(fontSize: 16),
                  ));
          }),
    );
  }

  Future<void> loadData() async {
    return await Network.getJson(Urls.getInjuryReport(),
        fileFormat: FileType.xml); // this is an xml file
  }
}

class InjuryReportItem {
  final String name;
  final String injury;
  final String notes;
  final String updated;
  final String team;

  InjuryReportItem(
      {this.name, this.injury, this.notes, this.updated, this.team});
}
