import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/team_tricode_card.dart';
import 'package:hoop/models/play_by_play_item.dart';

import '../../constant.dart';

class FullPbp extends StatelessWidget {
  final dynamic pbp;
  final dynamic game;

  FullPbp({this.pbp, this.game});

  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pbp.length,
                  itemBuilder: (context, index) {
                    return getPbpItem(pbp[index], game);
                    // Widget container;
                    // container = new Container(
                    //   padding: EdgeInsets.all(8),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(pbp[index]["clock"] + " - "),
                    //       TeamTricodeCardFromBoxScore(
                    //           desc: pbp[index]["description"], game: game),
                    //       Flexible(
                    //           child: Text(getPbPDescriptionFormatted(
                    //               pbp[index]["description"], game)))
                    //     ],
                    //   ),
                    // );
                    // return container;
                  }),
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

  Widget getPbpItem(dynamic play, dynamic game) {
    Widget container;
    Widget row;
    PlayByPlayItem pbp = PlayByPlayItem(play);

    row = Row(
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
