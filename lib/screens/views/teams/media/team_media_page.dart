import 'package:flutter/material.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/screens/views/news/team_video_feed.dart';
import 'package:hoop/screens/views/teams/media/team_news_page.dart';

class TeamMediaPage extends StatelessWidget {
  final teamId;

  TeamMediaPage({this.teamId});

  @override
  Widget build(BuildContext context) {
    var teamColor = ConstantHelper.getTeamColor(teamId);
    var teamTextColor = ConstantHelper.getTeamTextColor(teamId);
    var teamName = ConstantHelper.getTeamName(teamId);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color(0XFFEDF1FF),
          appBar: AppBar(
            backgroundColor: Color(teamColor),
            title: Text("$teamName Media"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("News",
                      style: TextStyle(color: Color(teamTextColor))),
                ),
                Tab(
                  child: Text("Video",
                      style: TextStyle(color: Color(teamTextColor))),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //NbaNewsFeed(),
              TeamNewsPage(teamName, teamId),
              TeamVideoFeed(
                teamId: teamId,
              )
            ],
          )),
    );
  }
}
