import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:hoop/json/jsons.dart';
import 'package:provider/provider.dart';
import 'package:hoop/components/games_widgets/gamelst.dart';
import 'package:hoop/components/connection.dart';

class Games extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF1F6BA3),
          automaticallyImplyLeading: false, // hides back arrow button
          toolbarHeight: 60,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Today",
              ),
              Tab(
                text: "Previous",
              ),
              Tab(
                text: "Upcoming",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [Text('Today games')],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [Text('Today games')],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
                  Provider.of<JsonFiles>(context, listen: false).getGames() ==
                          null
                      ? FutureBuilder(
                          future: Network.getJson(Urls.seasonGames),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              Provider.of<JsonFiles>(context, listen: false)
                                  .setGames(snapshot.data);
                              dynamic json = snapshot.data;
                              return SeasonGames(
                                jsonFile: json,
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error,
                                      size: 50,
                                    ),
                                    Text("An error occured!"),
                                  ],
                                ),
                              );
                            } else if (snapshot.data == null) {
                              return NoConnection();
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })
                      : SeasonGames(
                          jsonFile: Provider.of<JsonFiles>(context).getGames(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
