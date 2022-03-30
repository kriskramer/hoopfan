import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/components/games_widgets/game_event_video_dialog.dart';
import 'package:hoop/components/games_widgets/team_tricode_card.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';

class PbpPeriodView extends StatelessWidget {
  final String gameId;
  final String period;

  PbpPeriodView({this.gameId, this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var pbp = snapshot.data["resultSets"][0]["rowSet"];

                  if (pbp.length == 0) {
                    return Center(
                        child: Text("No Data returned for Period " +
                            period.toString()));
                  }

                  return Column(children: [
                    getHeader("Period " + period.toString()),
                    Text(
                        'Tap the game event below to see a video of the play.'),
                    SizedBox(height: 15),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pbp.length, //plays.length,
                        itemBuilder: (context, index) {
                          var teamId = pbp[index][15];

                          if (pbp[index][33] == 1 &&
                              pbp[index][13] != 0 &&
                              !isEventNull(pbp[index])) {
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GameEventVideoDialog(
                                        gameId: gameId,
                                        eventNum: pbp[index][1].toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(pbp[index][6] + " - "),
                                    (teamId == null)
                                        ? Text('')
                                        : TeamTricodeCardFromTeamId(
                                            teamId: teamId.toString()),
                                    Icon(Icons.play_arrow),
                                    Flexible(
                                        child: Text(
                                            getPbpDescription(pbp[index]))),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        }),
                  ]);
                } else {
                  return NoConnection();
                }
              }),
        ],
      ),
    );
  }

  Future<dynamic> loadData() async {
    return await Network.getJson(
      Urls.getNbaStatsAdvancedPlayByPlay(gameId, period, period),
      requestHeaders: RequestHeaders.nbaStatsHeaders,
    );
  }

  String getPbpDescription(dynamic pbp) {
    String desc = '';

    if (pbp[8] != null) {
      desc = pbp[8];
    } else if (pbp[7] != null) {
      desc = pbp[7];
    } else if (pbp[9] != null) {
      desc = pbp[9];
    }
    return desc;
  }

  bool isEventNull(dynamic pbp) {
    bool isNull = true;

    if (pbp[8] != null) {
      isNull = false;
    } else if (pbp[7] != null) {
      isNull = false;
    } else if (pbp[9] != null) {
      isNull = false;
    }

    // if (pbp[8].toString().startsWith("Instant Replay")) {
    //   return true;
    // }

    return isNull;
  }

  Widget getHeader(String text) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 20, color: Colors.white))));
  }
}
