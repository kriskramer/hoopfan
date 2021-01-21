import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class AccountMain extends StatefulWidget {
  @override
  _AccountMainState createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  @override
  Widget build(BuildContext context) {
    print('test');
    loadData();
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Text(
          'User Account',
          style: TextStyle(fontSize: 24),
        ),
        Divider(),
        Text('This feature is not fully implented.')
      ]),
    );
  }

  void loadData() async {
    // dynamic test =
    //     await Network.getJsonFromNbaStats(Urls.getNbaStatsShotTypes('203954'));
    // print(test);
    // dynamic test2 = await Network.getJsonFromNbaStats(
    //     Urls.getNbaStatsWinProbability('0022000157'));
    // print(test2);
    // dynamic test3 = await Network.getJsonFromNbaStats(Urls.getNbaStatsTest());
    // print(test3);
  }
}
