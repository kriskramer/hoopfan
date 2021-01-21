import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';

class TwitterFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadData();
    return Container();
  }

  Future<dynamic> loadData() async {
    var feed = await Network.getTwitterStream();
    print(feed);
  }
}
