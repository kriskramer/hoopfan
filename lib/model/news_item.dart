class NewsItem {
  var link;
  var title;
  var published;
  var summary;

  NewsItem(this.link, this.published, this.summary, this.title);
}

class NewsItemList {
  List<NewsItem> items = [];

  NewsItemList(dynamic json) {
    for (var n in json["entries"]) {
      items.add(NewsItem(n["link"], n["published"], n["summary"], n["title"]));
    }
  }

  void sortByDate() {
    items.sort((a, b) {
      return a.published.toString().compareTo(b.published.toString());
    });
  }
}
