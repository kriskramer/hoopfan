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

  void getLast10Points(String clock) {
    int clockIndex = 0;
    int last10vTeamPoints = 0;
    int last10hTeamPoints = 0;
    int last20vTeamPoints = 0;
    int last20hTeamPoints = 0;
    int last30vTeamPoints = 0;
    int last30hTeamPoints = 0;

    int vStart = 0;
    int hStart = 0;

    int counter = 0;

    for (int i = 0; i < items.length; i++) {
      if (items[i].clock == clock) {
        clockIndex = i;
        break;
      }
    }

    vStart = items[clockIndex].vScore;
    hStart = items[clockIndex].hScore;

    counter = 0;
    for (int i = clockIndex - 1; i >= 0; i--) {
      counter++;

      if (counter <= 10) {
        last10vTeamPoints = vStart - items[i].vScore;
        last10hTeamPoints = hStart - items[i].hScore;
        last20vTeamPoints = vStart - items[i].vScore;
        last20hTeamPoints = hStart - items[i].hScore;
        last30vTeamPoints = vStart - items[i].vScore;
        last30hTeamPoints = hStart - items[i].hScore;
      }

      if (counter <= 20) {
        last20vTeamPoints = vStart - items[i].vScore;
        last20hTeamPoints = hStart - items[i].hScore;
        last30vTeamPoints = vStart - items[i].vScore;
        last30hTeamPoints = hStart - items[i].hScore;
      }

      last30vTeamPoints = vStart - items[i].vScore;
      last30hTeamPoints = hStart - items[i].hScore;
    }

    int startingClock = int.parse(clock.split(":")[0]);

// TODO: this will only work for calculations within a period. Need to figure out the math to do it across quarters...
    for (int i = clockIndex - 1; i >= 0; i--) {
      int currentClock = int.parse(items[i].clock.split(":")[0]);
      int minutes = currentClock - startingClock;

      print(minutes);
    }
  }
}
