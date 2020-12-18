import 'package:flutter/material.dart';

class TeamInfoPage extends StatelessWidget {
  final dynamic team;
  final int teamColor;
  TeamInfoPage({@required this.team, this.teamColor});

  @override
  Widget build(BuildContext context) {
    final retired = team[5]["RetiredMembers"];
    final hof = team[4]["HallOfFameInductees"];
    final awards = team[3]["Awards"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Team Info'),
        backgroundColor: teamColor != null
            ? Color(teamColor)
            : Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 4,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ...teamSummary(team),
              ...awardsList(awards),
              ...retiredList(retired),
              ...hofList(hof),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> teamSummary(dynamic json) {
    List<Widget> list = new List<Widget>();

    list.add(
      Text(
        'Arena',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(
      Text(
        json[0]["Details"][0]["Arena"] +
            " (" +
            json[0]["Details"][0]["ArenaCapacity"] +
            ")",
        style: TextStyle(fontSize: 14),
      ),
    );
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    list.add(
      Text(
        'Owner',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(
      Text(
        json[0]["Details"][0]["Owner"],
        style: TextStyle(fontSize: 14),
      ),
    );
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    list.add(
      Text(
        'GM',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(
      Text(
        json[0]["Details"][0]["GeneralManager"],
        style: TextStyle(fontSize: 14),
      ),
    );
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    list.add(
      Text(
        'Coach',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(
      Text(
        json[0]["Details"][0]["HeadCoach"],
        style: TextStyle(fontSize: 14),
      ),
    );
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    list.add(
      Text(
        'G League Affiliate',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(
      Text(
        json[0]["Details"][0]["DLeagueAffiliation"],
        style: TextStyle(fontSize: 14),
      ),
    );
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    list.add(
      Text(
        'Year Founded',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(
      Text(
        json[0]["Details"][0]["YearFounded"].toString(),
        style: TextStyle(fontSize: 14),
      ),
    );

    list.add(
      SizedBox(
        height: 15,
      ),
    );

    return list;
  }

  List<Widget> awardsList(dynamic json) {
    List<Widget> list = new List<Widget>();

    dynamic champs = json[0]["Championships"];
    dynamic conf = json[1]["ConferenceTitles"];
    dynamic div = json[2]["DivitionalTitles"];

    list.add(SizedBox(
      height: 5,
    ));

    if (champs.length > 0) {
      list.add(Text(
        "Championships (${champs.length.toString()})",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ));

      for (var c in champs) {
        list.add(Text(
          c["YearAwarded"].toString(),
          style: TextStyle(fontSize: 24),
        ));
        list.add(Text("vs " + c["OppositeTeam"]));
      }
    }

    list.add(SizedBox(
      height: 15,
    ));

    if (conf.length > 0) {
      list.add(Text(
        "Conference Titles (${conf.length.toString()})",
        style: TextStyle(fontWeight: FontWeight.bold),
      ));

      String d = "";
      for (var c in conf) {
        d += c["YearAwarded"].toString();
        d += ", ";
      }
      list.add(Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(
          d,
          style: TextStyle(fontSize: 18),
        ),
      ));
    }

    list.add(SizedBox(
      height: 15,
    ));

    if (div.length > 0) {
      list.add(Text(
        "Division Titles (${div.length.toString()})",
        style: TextStyle(fontWeight: FontWeight.bold),
      ));

      String d = "";
      for (var c in div) {
        d += c["YearAwarded"].toString();
        d += ", ";
      }
      list.add(Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Center(
          child: Text(
            d,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ));
    }

    list.add(
      SizedBox(
        height: 15,
      ),
    );

    return list;
  }

  List<Widget> retiredList(dynamic json) {
    List<Widget> list = new List<Widget>();

    list.add(
      Text(
        'Retired Players and Executives',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(SizedBox(
      height: 5,
    ));

    for (var r in json) {
      String player = r["Player"] != null ? r["Player"].toString() : "";
      String position = r["Position"] != null ? r["Position"].toString() : "";
      String seasons =
          r["SeasonsWithTeam"] != null ? r["SeasonsWithTeam"].toString() : "";
      //String year = r["Year"] != null ? "(" + r["Year"].toString() + ")" : "";

      // Some execs go in with multiple titles, which flows off the screen
      if (position.length > 20) {
        position = position.substring(0, 17) + "...";
      }

//      list.add(Text("$player $year - $position - $seasons"));
      list.add(Text(
        player,
        style: TextStyle(fontSize: 18),
      ));
      // list.add(Text(
      //   "$year - $position",
      //   style: TextStyle(fontSize: 10),
      // ));
      list.add(Text(seasons));
      list.add(SizedBox(
        height: 15,
      ));
    }

    return list;
  }

  List<Widget> hofList(dynamic json) {
    List<Widget> list = new List<Widget>();

    list.add(
      Text(
        'Hall of Fame Members',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    list.add(SizedBox(
      height: 5,
    ));

    for (var r in json) {
      String player = r["Player"] != null ? r["Player"].toString() : "";
      String position = r["Position"] != null ? r["Position"].toString() : "";
      String seasons =
          r["SeasonsWithTeam"] != null ? r["SeasonsWithTeam"].toString() : "";
      String year = r["Year"] != null ? "(" + r["Year"].toString() + ")" : "";

      // Some execs go in with multiple titles, which flows off the screen
      if (position.length > 20) {
        position = position.substring(0, 17) + "...";
      }

      //      list.add(Text("$player $year - $position - $seasons"));
      list.add(Text(
        player,
        style: TextStyle(fontSize: 18),
      ));
      // list.add(Text(
      //   "$year - $position",
      //   style: TextStyle(fontSize: 10),
      // ));
      list.add(Text(seasons));
      list.add(SizedBox(
        height: 8,
      ));
    }

    list.add(
      SizedBox(
        height: 15,
      ),
    );
    return list;
  }
}
