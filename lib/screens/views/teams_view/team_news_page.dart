import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/constant.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamNewsPage extends StatelessWidget {
  final String teamName;
  final String teamId;
  TeamNewsPage(this.teamName, this.teamId);

  Future<bool> loadNews(BuildContext context) async {
    bool complete = false;

    if (Provider.of<JsonFiles>(context, listen: false).getNews(teamId) ==
        null) {
      try {
        var news =
            await Network.getJson(Urls.teamGoogleNewsSearch(this.teamName));
        if (news != null) {
          Provider.of<JsonFiles>(context, listen: false)
              .setTeamNews(teamId, news["entries"]);
        }
      } catch (e) {
        print(e);
      }
      complete = true;
    }

    return complete;
  }

  @override
  Widget build(BuildContext context) {
    final test = ConstantHelper.getTeamDetailsExtra(teamId);
    String primaryColor =
        test["primaryColor"].toString().replaceFirst("#", "FF");
    var teamColor = int.parse(primaryColor, radix: 16);

    return Scaffold(
      appBar: AppBar(
        title: Text('$teamName News'),
        backgroundColor: Color(teamColor),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: this.loadNews(context),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  dynamic json = Provider.of<JsonFiles>(context, listen: false)
                      .getNews(teamId);

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: json.length,
                    itemBuilder: (context, index) {
                      // Check if Id is in allTeam and points aint empty
                      return Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () {
                              Network.launchSite(json[index]["link"]);
                            },
                            child: Column(
                              children: [
                                Text(
                                  json[index]["title"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  json[index]["published"],
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(removeAllHtmlTags(json[index]["summary"])),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  json[index]["link"],
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
                      );
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
              })),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    htmlText = htmlText.replaceAll("&nbsp;", " ");
    RegExp exp1 = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    RegExp exp2 =
        RegExp(r"\xEF\xBF\xBD\u2022", multiLine: true, caseSensitive: true);
    //htmlText = Regex.Replace(htmlText,@"\xEF\xBF\xBD"," ");

    return htmlText.replaceAll(exp1, '').replaceAll(exp2, '');
  }
}
