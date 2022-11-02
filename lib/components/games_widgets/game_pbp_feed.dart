import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/full_pbp.dart';
import 'package:hoop/components/games_widgets/game_lead_chart_small.dart';
import 'package:hoop/components/games_widgets/game_player_popup.dart';
import 'package:hoop/components/games_widgets/game_video_feed.dart';
import 'package:hoop/components/games_widgets/pbp_dialog.dart';
import 'package:hoop/components/games_widgets/scoring_trends_inline_pbp.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/play_by_play_item.dart';
import 'package:hoop/screens/views/games/game_pbp.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class GamePbpFeed extends StatefulWidget {
  final dynamic gameData;
  final dynamic stats;

  GamePbpFeed({this.gameData, this.stats});

  @override
  _GamePbpFeedState createState() => _GamePbpFeedState();
}

class _GamePbpFeedState extends State<GamePbpFeed> {
  String date;
  String gameId;
  String period;
  dynamic _pbpFeed;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    date = widget.gameData["startDateEastern"];
    gameId = widget.gameData["gameId"];
    period = widget.gameData["period"]["current"].toString();

    getData(date, gameId, period);

    _timer = new Timer.periodic(Duration(seconds: 20), (t) {
      refreshData(date, gameId, period);
    });
  }

  void refreshData(String date, String gameId, String period) {
    setState(() {
      getData(date, gameId, period);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gameData["statusNum"] == false) {
      _timer.cancel();
    }
    period = widget.gameData["period"]["current"].toString();

    //print(period);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        FutureBuilder(
          future: _pbpFeed,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var plays = snapshot.data["plays"];
              if (plays.length == 0) {
                return Text("No data returned...");
              }
              return Column(children: [
                // SizedBox(
                //   height: 15,
                // ),
                ScoringTrendsInlinePbp(
                  game: widget.gameData,
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7, //plays.length,
                    itemBuilder: (context, index) {
                      int idx = index + plays.length - 7;
                      if (idx < 0) {
                        idx = 0;
                      }
                      return getPbpItem(
                          plays[idx], widget.gameData, widget.stats);
                    }),
                SizedBox(
                  height: 12,
                ),
                GameLeadChartSmall(
                  pbp: plays,
                  vTeamId: widget.gameData["vTeam"]["teamId"],
                  hTeamId: widget.gameData["hTeam"]["teamId"],
                  period: period,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GamePlayByPlay(
                                  gameData: widget.gameData,
                                ),
                              ));
                        },
                        child: Text('Lead Tracker',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullPbp(
                                    game: widget.gameData,
                                    pbp: plays,
                                    stats: widget.stats),
                              ));
                        },
                        child: Text('Full PBP',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameVideoFeed(gameId),
                              ));
                        },
                        child: Text('Video Feed',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ]),
              ]);
            }
            return Text('');
          },
        ),
        loadPbpData(date, widget.gameData, "1", context),
        widget.gameData["period"]["current"] >= 2
            ? loadPbpData(date, widget.gameData, "2", context)
            : SizedBox(),
        widget.gameData["period"]["current"] >= 3
            ? loadPbpData(date, widget.gameData, "3", context)
            : SizedBox(),
        widget.gameData["period"]["current"] >= 4
            ? loadPbpData(date, widget.gameData, "4", context)
            : SizedBox(),
        widget.gameData["period"]["current"] >= 5
            ? loadPbpData(date, widget.gameData, "5", context)
            : SizedBox(),
        widget.gameData["period"]["current"] >= 6
            ? loadPbpData(date, widget.gameData, "6", context)
            : SizedBox(),
      ]),
    );
  }

  Future<void> getData(String date, String gameId, String period) async {
    // Get the current period's pbp feed in real-time
    _pbpFeed = Network.getJson(Urls.nbaPlayByPlay(date, gameId, period));
  }

  Widget getPbpItem(dynamic play, dynamic game, dynamic stats) {
    Widget container;
    Widget row;
    PlayByPlayItem pbp = PlayByPlayItem(play);

    row = GestureDetector(
      onTap: () {
        if (pbp.personId != "" && pbp.personId != null) {
          showDialog(
              context: context,
              builder: (context) {
                return GamePlayerPopup(personId: pbp.personId, game: game);
              });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            pbp.clock + "  ",
            style: TextStyle(fontSize: 12),
          ),
          getTeamCard(pbp.description, widget.gameData),
          Flexible(
              child: Text(
            getPbPDescriptionFormatted(pbp, widget.gameData),
            style: pbp.isScoreChange
                ? TextStyle(fontSize: 14, color: Colors.black)
                : TextStyle(fontSize: 14, color: Colors.grey[800]),
          )),
          pbp.isScoreChange
              ? Container(height: 16, child: Image.asset('images/bball.png'))
              : SizedBox(),
          pbp.isVideoAvailable ? Icon(Icons.play_arrow) : SizedBox()
        ],
      ),
    );

    var teamColor = pbp.isScoreChange
        ? ConstantHelper.getTeamColor(pbp.teamId)
        : Colors.white;
    container = Container(
        padding: EdgeInsets.fromLTRB(22, 2, 22, 2),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300])),
          color: pbp.isScoreChange
              ? Color(teamColor).withOpacity(.10)
              : Colors.white,
        ),
        child: row);

    return container;
  }

  Widget getTeamCard(String desc, dynamic game) {
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];

    var vTeamId = widget.gameData["vTeam"]["teamId"];
    var hTeamId = widget.gameData["hTeam"]["teamId"];

    int vTeamIndex = desc.indexOf("[" + vTeamTriCode) + 1;
    int hTeamIndex = desc.indexOf("[" + hTeamTriCode) + 1;

    if (vTeamIndex > 0) {
      return getTeamTricodeCard(vTeamId);
    } else if (hTeamIndex > 0) {
      return getTeamTricodeCard(hTeamId);
    } else {
      return Text('');
    }
  }

  Widget getTeamTricodeCard(String teamId) {
    var teamColor = ConstantHelper.getTeamColor(teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(teamId);
    var tricode = ConstantHelper.getTeamTriCode(teamId);

    return Card(
      elevation: 2,
      color: Color(teamColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        child: Text(
          tricode,
          style: TextStyle(color: Color(teamTextColor), fontSize: 10),
        ),
      ),
    );
  }

  String getPbPDescriptionFormatted(PlayByPlayItem pbp, dynamic game) {
    String desc = pbp.description;
    if (pbp.isScoreChange) {
      ScoreTextBreakdown t = pbp.getTextBreakdown();
      String d = t.shotText;
    }

    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];
    desc = desc.replaceAll("[" + vTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + hTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + vTeamTriCode + " ", "[");
    desc = desc.replaceAll("[" + hTeamTriCode + " ", "[");

    return desc;
  }

  Widget loadPbpData(
      String date, dynamic gameData, String period, BuildContext context) {
    String date = gameData["startDateEastern"];
    String gameId = gameData["gameId"];
    Future<dynamic> _pbpFeed;

    _pbpFeed = Network.getJson(Urls.nbaPlayByPlay(date, gameId, period));

    return FutureBuilder(
        future:
            _pbpFeed, //Network.getJson(Urls.nbaPlayByPlay(date, gameId, period)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var plays = snapshot.data["plays"];

            Provider.of<JsonFiles>(context, listen: false)
                .setGamePbp(gameId + "-" + period, plays);

            return SizedBox();
          }
          return SizedBox();
        });
  }
}
