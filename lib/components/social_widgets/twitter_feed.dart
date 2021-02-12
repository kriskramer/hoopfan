import 'package:flutter/material.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';

class TwitterFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadData();
    return Container();
  }

  Future<dynamic> loadData() async {
    var feed = await Network.getJson(
        "https://api.twitter.com/2/tweets/search/stream?",
        requestHeaders: RequestHeaders.twitterStreamHeaders);
    print(feed);
  }
}
