import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/game_player_popup.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/models/play_by_play_item.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class FullPbp extends StatelessWidget {
  final dynamic pbp;
  final dynamic game;
  final dynamic stats;

  FullPbp({this.pbp, this.game, this.stats});

  @override
  Widget build(BuildContext context) {
    var period1 = Provider.of<JsonFiles>(context, listen: false)
        .getPbp(game["gameId"] + "-1");
    var period2 = Provider.of<JsonFiles>(context, listen: false)
        .getPbp(game["gameId"] + "-2");
    var period3 = Provider.of<JsonFiles>(context, listen: false)
        .getPbp(game["gameId"] + "-3");
    var period4 = Provider.of<JsonFiles>(context, listen: false)
        .getPbp(game["gameId"] + "-4");
    var period5 = Provider.of<JsonFiles>(context, listen: false)
        .getPbp(game["gameId"] + "-5");
    var period6 = Provider.of<JsonFiles>(context, listen: false)
        .getPbp(game["gameId"] + "-6");

    return Scaffold(
        appBar: AppBar(
          title: Text("Full Play-by-Play"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              period1 != null
                  ? Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[800]))),
                            child: Text(
                              "Period 1",
                              style: TextStyle(fontSize: 20),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            //itemCount: pbp.length,
                            itemCount: period1.length,
                            itemBuilder: (context, index) {
                              return getPbpItem(period1[index], game, context);
                            })
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              period2 != null
                  ? Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[800]))),
                            child: Text(
                              "Period 2",
                              style: TextStyle(fontSize: 20),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            //itemCount: pbp.length,
                            itemCount: period2.length,
                            itemBuilder: (context, index) {
                              return getPbpItem(period2[index], game, context);
                            })
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              period3 != null
                  ? Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[800]))),
                            child: Text(
                              "Period 3",
                              style: TextStyle(fontSize: 20),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: period3.length,
                            itemBuilder: (context, index) {
                              return getPbpItem(period3[index], game, context);
                            })
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              period4 != null
                  ? Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[800]))),
                            child: Text(
                              "Period 4",
                              style: TextStyle(fontSize: 20),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: period4.length,
                            itemBuilder: (context, index) {
                              return getPbpItem(period4[index], game, context);
                            })
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              period5 != null
                  ? Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[800]))),
                            child: Text(
                              "Period OT 1",
                              style: TextStyle(fontSize: 20),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            //itemCount: pbp.length,
                            itemCount: period5.length,
                            itemBuilder: (context, index) {
                              return getPbpItem(period5[index], game, context);
                            })
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              period6 != null
                  ? Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[800]))),
                            child: Text(
                              "Period OT 2",
                              style: TextStyle(fontSize: 20),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: period6.length,
                            itemBuilder: (context, index) {
                              return getPbpItem(period6[index], game, context);
                            })
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }

  String getPbPDescriptionFormatted(String desc, dynamic game) {
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];
    desc = desc.replaceAll("[" + vTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + hTeamTriCode + "]", "");
    desc = desc.replaceAll("[" + vTeamTriCode + " ", "[");
    desc = desc.replaceAll("[" + hTeamTriCode + " ", "[");

    return desc;
  }

  Widget getPbpItem(dynamic play, dynamic game, BuildContext context) {
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
          getTeamCard(pbp.description, game),
          Flexible(
              child: Text(
            getPbPDescriptionFormatted(pbp.description, game),
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

    var vTeamId = game["vTeam"]["teamId"];
    var hTeamId = game["hTeam"]["teamId"];

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

  // String getPbPDescriptionFormatted(PlayByPlayItem pbp, dynamic game) {
  //   String desc = pbp.description;
  //   if (pbp.isScoreChange) {
  //     ScoreTextBreakdown t = pbp.getTextBreakdown();
  //     String d = t.shotText;
  //   }

  //   String vTeamTriCode = game["vTeam"]["triCode"];
  //   String hTeamTriCode = game["hTeam"]["triCode"];
  //   desc = desc.replaceAll("[" + vTeamTriCode + "]", "");
  //   desc = desc.replaceAll("[" + hTeamTriCode + "]", "");
  //   desc = desc.replaceAll("[" + vTeamTriCode + " ", "[");
  //   desc = desc.replaceAll("[" + hTeamTriCode + " ", "[");

  //   return desc;
  // }
}
