import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/games_widgets/game_event_video_player.dart';
import 'package:hoop/services/headers.dart';
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
            var desc = json["resultSets"]["playlist"][0];

            //print(urls);

            //Network.launchSite(urls["murl"]);

            return Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
                    Text(desc["dsc"]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(desc["va"]),
                        SizedBox(
                          width: 10,
                        ),
                        Text(desc["ha"]),
                      ],
                    ),
                    Text(desc["gc"].toString().split("/")[0]),
                    GameEventVideoPlayer(urls["murl"]),
                    // ElevatedButton(
                    //   child: Text('Play'),
                    //   onPressed: () {
                    //     Network.launchSite(urls["murl"]);
                    //   },
                    // )
                  ],
                ),
              ),
            );
          } else {
            return NoConnection();
          }
        },
      ),
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaPbpEventVideo(gameId, eventNum),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }
}
