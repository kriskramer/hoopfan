import 'package:flutter/material.dart';

import '../../constant.dart';

class GameFoulTroubleFeed extends StatelessWidget {
  final dynamic game;
  final dynamic stats;

  GameFoulTroubleFeed({this.game, this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foul Trouble',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...getFoulLeaders(stats, game),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Heavy Minutes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...getMinutesLeaders(stats, game),
              ],
            )
          ]),
    );
  }

  List<Widget> getFoulLeaders(dynamic stats, dynamic game) {
    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];
    int vTeamColor = ConstantHelper.getTeamColor(game["vTeam"]["teamId"]);
    int hTeamColor = ConstantHelper.getTeamColor(game["hTeam"]["teamId"]);
    int vTeamTextColor =
        ConstantHelper.getTeamTextColor(game["vTeam"]["teamId"]);
    int hTeamTextColor =
        ConstantHelper.getTeamTextColor(game["hTeam"]["teamId"]);
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];
    int period = game["period"]["current"];
    List<Widget> list = new List<Widget>();
    List<dynamic> vTeamPlayers = new List<dynamic>();
    List<dynamic> hTeamPlayers = new List<dynamic>();
    dynamic players = stats["activePlayers"];

    // Loop through players and assign to teams
    for (var p in players) {
      if (p["teamId"] == hTeamId && getPersonalFouls(p["pFouls"]) >= period) {
        hTeamPlayers.add(p);
      }
    }

    if (hTeamPlayers.length > 0) {
      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      hTeamPlayers.sort((a, b) {
        try {
          return getPersonalFouls(a["pFouls"]) < getPersonalFouls(b["pFouls"])
              ? 1
              : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    }

    // Loop through players and assign to teams
    for (var p in players) {
      if (p["teamId"] == vTeamId && getPersonalFouls(p["pFouls"]) >= period) {
        vTeamPlayers.add(p);
      }
    }

    if (vTeamPlayers.length > 0) {
      // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
      vTeamPlayers.sort((a, b) {
        try {
          return getPersonalFouls(a["pFouls"]) < getPersonalFouls(b["pFouls"])
              ? 1
              : -1;
        } catch (e) {
          //print(e);
          return -1;
        }
      });
    }

    for (var p in vTeamPlayers) {
      list.add(Row(children: [
        Card(
          elevation: 1,
          child: Container(
            color: Color(vTeamColor),
            child: Text(
              vTeamTriCode.toUpperCase(),
              style: TextStyle(color: Color(vTeamTextColor)),
            ),
            padding: EdgeInsets.all(4),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          p["lastName"] + " - ",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          p["pFouls"],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ]));
    }
    for (var p in hTeamPlayers) {
      list.add(Row(children: [
        Card(
          elevation: 1,
          child: Container(
            color: Color(hTeamColor),
            child: Text(
              hTeamTriCode.toUpperCase(),
              style: TextStyle(color: Color(hTeamTextColor)),
            ),
            padding: EdgeInsets.all(4),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          p["lastName"] + " - ",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          p["pFouls"],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ]));
    }

    return list;
  }

  List<Widget> getMinutesLeaders(dynamic stats, dynamic game) {
    String vTeamId = game["vTeam"]["teamId"];
    String hTeamId = game["hTeam"]["teamId"];
    int vTeamColor = ConstantHelper.getTeamColor(game["vTeam"]["teamId"]);
    int hTeamColor = ConstantHelper.getTeamColor(game["hTeam"]["teamId"]);
    int vTeamTextColor =
        ConstantHelper.getTeamTextColor(game["vTeam"]["teamId"]);
    int hTeamTextColor =
        ConstantHelper.getTeamTextColor(game["hTeam"]["teamId"]);
    String vTeamTriCode = game["vTeam"]["triCode"];
    String hTeamTriCode = game["hTeam"]["triCode"];
    int period = game["period"]["current"];
    List<Widget> list = new List<Widget>();
    List<dynamic> vTeamPlayers = new List<dynamic>();
    List<dynamic> hTeamPlayers = new List<dynamic>();
    dynamic players = stats["activePlayers"];

    // Loop through players and assign to teams
    for (var p in players) {
      if (p["teamId"] == hTeamId) {
        hTeamPlayers.add(p);
      }
    }

    // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
    hTeamPlayers.sort((a, b) {
      try {
        String minA = a["min"];
        String minB = b["min"];
        int minutesA = int.parse(minA.substring(0, minA.indexOf(":") - 1));
        int minutesB = int.parse(minB.substring(0, minB.indexOf(":") - 1));

        return (minutesA < minutesB) ? 1 : -1;
      } catch (e) {
        //print(e);
        return -1;
      }
    });

    // Loop through players and assign to teams
    for (var p in players) {
      if (p["teamId"] == vTeamId) {
        vTeamPlayers.add(p);
      }
    }

    // Have to do the try/catch on the sort because some players have no values if they're marked as DNP
    vTeamPlayers.sort((a, b) {
      try {
        String minA = a["min"];
        String minB = b["min"];
        int minutesA = int.parse(minA.substring(0, minA.indexOf(":")));
        int minutesB = int.parse(minB.substring(0, minB.indexOf(":")));

        return (minutesA < minutesB) ? 1 : -1;
      } catch (e) {
        //print(e);
        return -1;
      }
    });

    for (int i = 0; i < 3; i++) {
      list.add(Row(children: [
        Card(
          elevation: 1,
          child: Container(
            color: Color(vTeamColor),
            child: Text(
              vTeamTriCode.toUpperCase(),
              style: TextStyle(color: Color(vTeamTextColor)),
            ),
            padding: EdgeInsets.all(4),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          vTeamPlayers[i]["lastName"] + " - ",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          vTeamPlayers[i]["min"],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ]));
    }

    for (int i = 0; i < 3; i++) {
      list.add(Row(children: [
        Card(
          elevation: 1,
          child: Container(
            color: Color(hTeamColor),
            child: Text(
              hTeamTriCode.toUpperCase(),
              style: TextStyle(color: Color(hTeamTextColor)),
            ),
            padding: EdgeInsets.all(4),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          hTeamPlayers[i]["lastName"] + " - ",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          hTeamPlayers[i]["min"],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ]));
    }

    return list;
  }

  // Need this method to do cleanup on the JSON values, which can sometimes be null or empty
  int getPersonalFouls(String value) {
    if (value == "") return 0;
    if (value == "0") return 0;

    var fouls = 0;

    fouls = int.tryParse(value);

    if (fouls == null) fouls = 0;

    return fouls;
  }
}
