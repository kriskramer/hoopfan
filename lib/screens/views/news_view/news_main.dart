import 'package:flutter/material.dart';
import 'package:hoop/screens/views/news_view/news_feed.dart';
import 'package:hoop/screens/views/news_view/transactions_view.dart';

class NewsMainScreen extends StatefulWidget {
  @override
  _NewsMainScreenState createState() => _NewsMainScreenState();
}

class _NewsMainScreenState extends State<NewsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0XFFEDF1FF),
        appBar: AppBar(
          toolbarHeight: 60,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "News",
              ),
              Tab(
                text: "Video",
              ),
              Tab(
                text: "Transactions",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NbaNewsFeed(),
            SingleChildScrollView(
              child: Text('Video List'),
            ),
            Transactions(),
          ],
        ),
      ),
    );
  }
}
