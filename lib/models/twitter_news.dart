class TwitterNewsItem {
  var text;
  var id;
  var created;

  TwitterNewsItem({this.text, this.id, this.created});
}

class TwitterNewsItemList {
  List<TwitterNewsItem> items = [];

  TwitterNewsItemList(dynamic json) {
    for (var t in json["data"]) {
      if (!tweetBlocked(t)) {
        items.add(TwitterNewsItem(
            text: t["text"], id: t["id"], created: t["created_at"]));
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