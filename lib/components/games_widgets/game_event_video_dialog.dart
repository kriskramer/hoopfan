import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class GameEventVideoDialog extends StatelessWidget {
  final String gameId;
  final String eventNum;

  GameEventVideoDialog({this.gameId, this.eventNum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var json = snapshot.data;
            var urls = json["resultSets"]["Meta"]["videoUrls"][0];

            print(urls);

            Network.launchSite(urls["murl"]);

            return Text('');
          } else {
            return NoConnection();
          }
        },
      ),
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJsonFromNbaStats(
        Urls.getNbaPbpEventVideo(gameId, eventNum));
  }
}
