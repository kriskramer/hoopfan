class Lineup {
  var team;
  var name;
  var position;
  var confirmed;

  Lineup(this.team, this.name, this.position, this.confirmed);
}

class LineupList {
  List<Lineup> items = [];

  LineupList(dynamic json) {
    Map<String, dynamic> data = new Map<String, dynamic>.from(json["lineups"]);
    for (var t in data.entries) {
      var teamName = t.key;
      items.add(Lineup(
          teamName, t.value["C"]["name"], "C", t.value["C"]["confirmed"]));
      items.add(Lineup(
          teamName, t.value["PF"]["name"], "PF", t.value["PF"]["confirmed"]));
      items.add(Lineup(
          teamName, t.value["SF"]["name"], "SF", t.value["SF"]["confirmed"]));
      items.add(Lineup(
          teamName, t.value["SG"]["name"], "SG", t.value["SG"]["confirmed"]));
      items.add(Lineup(
          teamName, t.value["PG"]["name"], "PG", t.value["PG"]["confirmed"]));
    }
  }
}
