class LeadTrackerItem {
  String clock;
  int period;
  int vScore;
  int hScore;
  bool isScoreChange;

  LeadTrackerItem(
      {this.clock, this.period, this.vScore, this.hScore, this.isScoreChange});

  int getLead() {
    int lead = vScore - hScore;
    if (lead < 0) {
      lead = lead * -1;
    }

    return lead;
  }

  bool isHomeLead() {
    int lead = hScore - vScore;

    if (lead > 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isVisitorLead() {
    int lead = vScore - hScore;

    if (lead > 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isTie() {
    int lead = hScore - vScore;

    if (lead == 0) {
      return true;
    } else {
      return false;
    }
  }
}

class LeadTrackerList {
  List<LeadTrackerItem> items = new List<LeadTrackerItem>();

  void importPbp(dynamic pbp, int period) {
    for (var p in pbp) {
      LeadTrackerItem item = new LeadTrackerItem(
          clock: p["clock"],
          period: 1,
          vScore: int.parse(p["vTeamScore"]),
          hScore: int.parse(p["hTeamScore"]),
          isScoreChange: p["isScoreChange"]);
      if (item.isScoreChange) {
        items.add(item);
      }
    }
  }
}
