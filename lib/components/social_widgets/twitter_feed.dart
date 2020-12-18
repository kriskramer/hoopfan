import 'package:flutter/material.dart';
import 'package:hoop/services/network.dart';

class TwitterFeed extends StatelessWidget {
  Future<dynamic> _feed;
  @override
  Widget build(BuildContext context) {
    loadData();
    return Container();
  }

  Future<dynamic> loadData() async {
    _feed = await Network.getTwitterStream();
    print(_feed);
  }
}
