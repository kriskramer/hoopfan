import 'package:flutter/material.dart';
import 'package:hoop/models/game_data.dart';

class HowToWatchCard extends StatelessWidget {
  final GameData game;

  HowToWatchCard({this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("HOW TO WATCH", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: Text(
                  getHowToWatchBroadcast(game),
                  style: TextStyle(fontSize: 12),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 12),
                child: Text(
                  getHowToWatchAudio(game),
                  style: TextStyle(fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }

  String getHowToWatchBroadcast(dynamic game) {
    String howToWatch = "Not yet listed";
    String nat, v, h;

    if (game["watch"] == null) {
      return howToWatch;
    }
    if (game["watch"]["broadcast"] == null) {
      return howToWatch;
    }
    if (game["watch"]["broadcast"]["broadcasters"] == null) {
      return howToWatch;
    }
    if (game["watch"]["broadcast"]["broadcasters"]["national"] == null) {
      return howToWatch;
    }
    if (game["watch"]["broadcast"]["broadcasters"]["hTeam"] == null) {
      return howToWatch;
    }
    if (game["watch"]["broadcast"]["broadcasters"]["vTeam"] == null) {
      return howToWatch;
    }

    if (game["watch"]["broadcast"]["broadcasters"]["national"].length > 0) {
      nat =
          game["watch"]["broadcast"]["broadcasters"]["national"][0]["longName"];
    } else {
      nat = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["hTeam"].length > 0) {
      h = game["watch"]["broadcast"]["broadcasters"]["hTeam"][0]["longName"];
    } else {
      h = "";
    }
    if (game["watch"]["broadcast"]["broadcasters"]["vTeam"].length > 0) {
      v = game["watch"]["broadcast"]["broadcasters"]["vTeam"][0]["longName"];
    } else {
      v = "";
    }

    howToWatch =
        "Broadcast: ${nat == "" ? "" : nat + ",  "}${v == "" ? "" : v + ",  "}$h";

    return howToWatch;
  }

  String getHowToWatchAudio(dynamic game) {
    String howToWatch = "";
    String nat, v, h;

    if (game["watch"]["broadcast"]["audio"]["national"]["broadcasters"] ==
        null) {
      return howToWatch;
    }

    if (game["watch"]["broadcast"]["audio"]["national"]["broadcasters"].length >
        0) {
      nat = game["watch"]["broadcast"]["audio"]["national"]["broadcasters"][0]
          ["longName"];
    } else {
      nat = "";
    }
    if (game["watch"]["broadcast"]["audio"]["hTeam"]["broadcasters"].length >
        0) {
      h = game["watch"]["broadcast"]["audio"]["hTeam"]["broadcasters"][0]
          ["longName"];
    } else {
      h = "";
    }
    if (game["watch"]["broadcast"]["audio"]["vTeam"]["broadcasters"].length >
        0) {
      v = game["watch"]["broadcast"]["audio"]["vTeam"]["broadcasters"][0]
          ["longName"];
    } else {
      v = "";
    }

    howToWatch =
        "Radio: ${nat == "" ? "" : nat + ",  "}${v == "" ? "" : v + ",  "}$h";

    return howToWatch;
  }
}
