class TwitterNewsItem {
  var text;
  var id;
  var created;

  TwitterNewsItem({this.text, this.id, this.created});

  String getShortText() {
    if (text.toString().length > 119) {
      return text.toString().substring(0, 120) + "...";
    } else {
      return text;
    }
  }
}

class TwitterNewsItemList {
  List<TwitterNewsItem> items = [];

  TwitterNewsItemList(dynamic json) {
    if (json["data"] != null) {
      for (var t in json["data"]) {
        if (!tweetBlocked(t)) {
          items.add(TwitterNewsItem(
              text: t["text"], id: t["id"], created: t["created_at"]));
        }
      }
    }
  }

  bool tweetBlocked(dynamic tweet) {
    // if (tweet["entities"] != null) {
    //   if (tweet["entites"]["mentions"] != null) {}
    // }

    return false;
  }
}

//TODO: Need to create a block list that checks the mentions in each tweet and blocks that tweet
// This will be used to block out ads and other nonsense tweets