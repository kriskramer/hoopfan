import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';

class TeamTricodeCard extends StatelessWidget {
  final String desc;
  final dynamic game;

  TeamTricodeCard({this.desc, this.game});

  @override
  Widget build(BuildContext context) {
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];

    var vTeamId = game["vTeam"]["teamId"];
    var hTeamId = game["hTeam"]["teamId"];
    var vTeamColor = ConstantHelper.getTeamColor(vTeamId);
    var vTeamTextColor = ConstantHelper.getTeamTextColor(vTeamId);
    var hTeamColor = ConstantHelper.getTeamColor(hTeamId);
    var hTeamTextColor = ConstantHelper.getTeamTextColor(hTeamId);

    int vTeamIndex = desc.indexOf("[" + vTeamTriCode) + 1;
    int hTeamIndex = desc.indexOf("[" + hTeamTriCode) + 1;

    if (vTeamIndex > 0) {
      return Card(
        elevation: 2,
        color: Color(vTeamColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          padding: EdgeInsets.all(2),
          child: Text(
            vTeamTriCode,
            style: TextStyle(color: Color(vTeamTextColor), fontSize: 12),
          ),
        ),
      );
    } else if (hTeamIndex > 0) {
      return Card(
        elevation: 2,
        color: Color(hTeamColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          padding: EdgeInsets.all(2),
          child: Text(
            hTeamTriCode,
            style: TextStyle(color: Color(hTeamTextColor), fontSize: 12),
          ),
        ),
      );
    } else {
      return Text('');
    }
  }
}
