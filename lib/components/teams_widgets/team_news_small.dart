import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamNewsSmall extends StatelessWidget {
  final String teamName;
  final String teamId;
  TeamNewsSmall(this.teamName, this.teamId);

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
    // bool blocked =
    //     Provider.of<JsonFiles>(context, listen: false).getIsFeatureBlocked();
    bool blocked = false;

    return FutureBuilder(
        future: this.loadNews(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            dynamic json =
                Provider.of<JsonFiles>(context, listen: false).getNews(teamId);

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                // Check if Id is in allTeam and points aint empty
                return Container(
                  margin: EdgeInsets.all(2),
                  child: InkWell(
                    onTap: () {
                      Network.launchSite(json[index]["link"]);
                    },
                    child: Column(
                      children: [
                        Text(
                          json[index]["title"],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Divider(),
                      ],
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
        });
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
