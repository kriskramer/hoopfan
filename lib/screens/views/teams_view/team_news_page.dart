import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class TeamNewsPage extends StatelessWidget {
  final String team;
  TeamNewsPage(this.team);

  Future<bool> loadNews(BuildContext context) async {
    bool complete = false;
    try {
      var news = await Network.getJson(Urls.teamNews(this.team));
      Provider.of<JsonFiles>(context, listen: false).setTeamNews(news);
    } catch (e) {
      print(e);
    }
    complete = true;

    return complete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$team News'),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: this.loadNews(context),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  dynamic json =
                      Provider.of<JsonFiles>(context, listen: false).getNews();
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: json.length,
                    itemBuilder: (context, index) {
                      // Check if Id is in allTeam and points aint empty
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            Network.launchSite(json[index]["url"]);
                          },
                          child: Column(
                            children: [
                              Text(
                                json[index]["title"],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                              Text(json[index]["description"]
                                  .toString()
                                  .replaceAll('\n', '')),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                json[index]["url"],
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 4,
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
              })),
    );
  }
}
