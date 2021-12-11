// Used with Google news search
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
      return b.published.toString().compareTo(a.published.toString());
    });
  }
}

// Used with FreeNewsAPI articles
class NewsItem2 {
  var link;
  var title;
  var published;
  var summary;

  NewsItem2(this.link, this.published, this.summary, this.title);
}

class NewsItem2List {
  List<NewsItem> items = [];

  NewsItem2List(dynamic json) {
    for (var n in json["articles"]) {
      items.add(
          NewsItem(n["link"], n["published_date"], n["summary"], n["title"]));
    }
  }

  void sortByDate() {
    items.sort((a, b) {
      return b.published.toString().compareTo(a.published.toString());
    });
  }
}
