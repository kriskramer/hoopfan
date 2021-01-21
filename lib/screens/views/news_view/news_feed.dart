import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class NbaNewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool blocked = true;
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: blocked
            ? Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    'This feature is blocked for testing. It will be re-enabled once the app goes live.'),
              )
            : FutureBuilder(
                future: loadData(context),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var news = Provider.of<JsonFiles>(context, listen: false)
                        .getNbaNews();

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: news["entries"].length,
                      itemBuilder: (context, index) {
                        // Check if Id is in allTeam and points aint empty
                        return Column(children: [
                          Card(
                            elevation: 3,
                            child: Container(
                              margin: EdgeInsets.all(12),
                              child: InkWell(
                                onTap: () {
                                  Network.launchSite(
                                      news["entries"][index]["link"]);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      news["entries"][index]["title"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      news["entries"][index]["published"],
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(removeAllHtmlTags(
                                        news["entries"][index]["summary"])),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      news["entries"][index]["link"],
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.blue),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
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
    var n = Provider.of<JsonFiles>(context, listen: false).getNbaNews();

    if (n == null) {
      try {
        var news =
            await Network.getJson(Urls.teamGoogleNewsSearch("nba basketball"));
        Provider.of<JsonFiles>(context, listen: false).setNbaNews(news);
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
}
