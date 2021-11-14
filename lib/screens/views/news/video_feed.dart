import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/headers.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class NbaVideoFeed extends StatelessWidget {
  final searchTerms;

  NbaVideoFeed({this.searchTerms});

  @override
  Widget build(BuildContext context) {
    bool blocked =
        Provider.of<JsonFiles>(context, listen: false).getIsFeatureBlocked();
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
                    var videos = Provider.of<JsonFiles>(context, listen: false)
                        .getNbaVideos();

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 350,
                        childAspectRatio: 4 / 3.1,
                        //crossAxisSpacing: 5,
                        //mainAxisSpacing: 5
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: videos["value"].length,
                      itemBuilder: (context, index) {
                        // Check if Id is in allTeam and points aint empty
                        return Column(children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            color: Colors.black,
                            child: InkWell(
                              onTap: () {
                                Network.launchSite(
                                    videos["value"][index]["contentUrl"]);
                              },
                              child: Stack(children: [
                                Image.network(
                                    videos["value"][index]["thumbnailUrl"]),
                                Text(
                                  videos["value"][index]["name"],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ]),
                            ),
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
    var n = Provider.of<JsonFiles>(context, listen: false).getNbaVideos();

    if (n == null) {
      try {
        var videos = await Network.getJson(
          Urls.getBingVideoSearch(searchTerms),
          requestHeaders: RequestHeaders.bingHeaders,
        );
        Provider.of<JsonFiles>(context, listen: false).setNbaVideo(videos);
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
