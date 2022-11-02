class ChatItem {
  int timestamp;
  String comment;
  String displayName;
  int fanLevel;
  int cheers;
  int boos;

  ChatItem(String ts, dynamic json) {
    timestamp = int.parse(ts);
    cheers = json["cheers"];
    boos = json["boos"];
    fanLevel = json["fanLevel"] == null ? 0 : json["fanLevel"];
    comment = json["comment"];
    displayName = json["displayName"];
  }
}

class ChatFeedList {
  List<ChatItem> items = [];

  void sort() {
    items.sort((a, b) {
      if (b.timestamp < a.timestamp)
        return 1;
      else
        return -1;
    });
  }
}
