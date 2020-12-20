import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamVideoFeed extends StatelessWidget {
  final String teamId;

  TeamVideoFeed({this.teamId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: loadData(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var videos = Provider.of<JsonFiles>(context, listen: false)
                    .getTeamVideos(teamId);

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: videos["value"].length,
                  itemBuilder: (context, index) {
                    // Check if Id is in allTeam and points aint empty
                    return Column(children: [
                      InkWell(
                        onTap: () {
                          Network.launchSite(
                              videos["value"][index]["contentUrl"]);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            Stack(children: [
                              Image.network(
                                  videos["value"][index]["thumbnailUrl"]),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  videos["value"][index]["name"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ]),
                            Text(
                              videos["value"][index]["thumbnailUrl"],
                              style:
                                  TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                            Text(
                              formatDate(
                                  videos["value"][index]["datePublished"]),
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ]);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 50,
                      ),
                      Text("An error occured!"),
                    ],
                  ),
                );
              } else if (snapshot.data == null) {
                return NoConnection();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<bool> loadData(BuildContext context) async {
    var teamName = ConstantHelper.getTeamName(teamId);
    var n =
        Provider.of<JsonFiles>(context, listen: false).getTeamVideos(teamId);

    if (n == null) {
      try {
        var videos = await Network.getJsonWithBingHeader(
            Urls.getBingVideoSearch(teamName));
        Provider.of<JsonFiles>(context, listen: false)
            .setTeamVideos(teamId, videos);
        return true;
      } catch (e) {
        print(e);
      }
    } else {
      return true;
    }

    return false;
  }

  String removeAllHtmlTags(String htmlText) {
    htmlText = htmlText.replaceAll("&nbsp;", " ");
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  String formatDate(String date) {
    String d = "";

    var dt = DateTime.parse(date);
    d = "${dt.month}-${dt.day}-${dt.year}";

    return d;
  }
}
