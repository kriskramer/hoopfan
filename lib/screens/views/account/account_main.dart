import 'package:flutter/material.dart';
import 'package:hoop/screens/views/account/updates_main.dart';
import 'package:hoop/screens/views/account/user_main.dart';

class AccountMain extends StatefulWidget {
  @override
  _AccountMainState createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  @override
  Widget build(BuildContext context) {
    //print('test');
    //loadData();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0XFFEDF1FF),
        appBar: AppBar(
          toolbarHeight: 30,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Updates",
              ),
              Tab(
                text: "User",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpdatesMain(),
            UserMain(),
          ],
        ),
      ),
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
