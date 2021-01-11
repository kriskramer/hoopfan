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
    if (pbp != null) {
      for (var p in pbp) {
        LeadTrackerItem item = new LeadTrackerItem(
            clock: p["clock"],
            period: period,
            vScore: int.parse(p["vTeamScore"]),
            hScore: int.parse(p["hTeamScore"]),
            isScoreChange: p["isScoreChange"]);
        if (item.isScoreChange) {
          items.add(item);
        }
      }
    }
  }

  RecentPoints getRecentPoints(String clock, String period) {
    int clockIndex = 0;
    RecentPoints rp = RecentPoints();
    int vStart = 0;
    int hStart = 0;
    int counter = 0;

    for (int i = 0; i < items.length; i++) {
      if (items[i].clock == clock && items[i].period.toString() == period) {
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
        rp.last10vTeamPoints = vStart - items[i].vScore;
        rp.last10hTeamPoints = hStart - items[i].hScore;
        rp.last20vTeamPoints = vStart - items[i].vScore;
        rp.last20hTeamPoints = hStart - items[i].hScore;
        rp.last30vTeamPoints = vStart - items[i].vScore;
        rp.last30hTeamPoints = hStart - items[i].hScore;
      }

      if (counter <= 20) {
        rp.last20vTeamPoints = vStart - items[i].vScore;
        rp.last20hTeamPoints = hStart - items[i].hScore;
        rp.last30vTeamPoints = vStart - items[i].vScore;
        rp.last30hTeamPoints = hStart - items[i].hScore;
      }

      if (counter <= 30) {
        rp.last30vTeamPoints = vStart - items[i].vScore;
        rp.last30hTeamPoints = hStart - items[i].hScore;
      }
    }

    int startingClock = getCurrentMinute(clock, period);

    for (int i = clockIndex - 1; i >= 0; i--) {
      int currentClock =
          getCurrentMinute(items[i].clock, items[i].period.toString());
      int minutes = startingClock - currentClock;

      if (minutes <= 5) {
        rp.vTeamLast5Min = vStart - items[i].vScore;
        rp.hTeamLast5Min = hStart - items[i].hScore;
        rp.vTeamLast10Min = vStart - items[i].vScore;
        rp.hTeamLast10Min = hStart - items[i].hScore;
        rp.vTeamLast15Min = vStart - items[i].vScore;
        rp.hTeamLast15Min = hStart - items[i].hScore;
      }

      if (minutes <= 10) {
        rp.vTeamLast10Min = vStart - items[i].vScore;
        rp.hTeamLast10Min = hStart - items[i].hScore;
        rp.vTeamLast15Min = vStart - items[i].vScore;
        rp.hTeamLast15Min = hStart - items[i].hScore;
      }

      if (minutes <= 15) {
        rp.vTeamLast15Min = vStart - items[i].vScore;
        rp.hTeamLast15Min = hStart - items[i].hScore;
      }
    }

    return rp;
  }

  int getCurrentMinute(String clock, String period) {
    // The clock shows up the minutes remaining in the quarter. We need the minutes passed, so subtrack it from 12.
    int minute = int.parse(clock.split(":")[0]);
    int total = 0;
    int currentPeriod = int.parse(period);

    for (int i = 1; i <= currentPeriod; i++) {
      if (i <= 4) total += 12;
      if (i > 4) total += 5;
    }

    int currentMinute = total - minute;

    return currentMinute;
  }
}

class RecentPoints {
  int last10vTeamPoints = 0;
  int last10hTeamPoints = 0;
  int last20vTeamPoints = 0;
  int last20hTeamPoints = 0;
  int last30vTeamPoints = 0;
  int last30hTeamPoints = 0;

  int vTeamLast5Min = 0;
  int hTeamLast5Min = 0;
  int vTeamLast10Min = 0;
  int hTeamLast10Min = 0;
  int vTeamLast15Min = 0;
  int hTeamLast15Min = 0;

  bool isValid() {
    if (last10vTeamPoints < 0 ||
        last10hTeamPoints < 0 ||
        last20vTeamPoints < 0 ||
        last20hTeamPoints < 0 ||
        last30vTeamPoints < 0 ||
        last30hTeamPoints < 0) {
      return false;
    }

    if (vTeamLast5Min < 0 ||
        hTeamLast5Min < 0 ||
        vTeamLast10Min < 0 ||
        hTeamLast10Min < 0 ||
        vTeamLast15Min < 0 ||
        hTeamLast15Min < 0) {
      return false;
    }

    return true;
  }
}
