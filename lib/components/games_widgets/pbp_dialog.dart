import 'package:flutter/material.dart';
import 'package:hoop/components/games_widgets/team_tricode_card.dart';

class PbpDialog extends StatelessWidget {
  final dynamic pbp;
  //final LeadTrackerItem item;
  final dynamic game;

  PbpDialog({this.pbp, this.game});

  @override
  Widget build(BuildContext context) {
    Widget dialog;
    dialog = new Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListView.builder(
                //controller: _scrollController,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pbp.length,
                itemBuilder: (context, index) {
                  Widget container;
                  container = new Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(pbp[index]["clock"] + " - "),
                        TeamTricodeCard(
                            desc: pbp[index]["description"], game: game),
                        Flexible(
                            child: Text(getPbPDescriptionFormatted(
                                pbp[index]["description"], game)))
                      ],
                    ),
                  );
                  return container;
                }),
          ],
        ),
      ),
    );

    return dialog;
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
}
