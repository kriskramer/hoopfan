import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/teams_view/teaminfo.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
          future: loadData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Widget> list = new List<Widget>();

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == true) {
              list.add(Text('Last 200 Transactions',
                  style: TextStyle(fontSize: 24)));
              list.add(SizedBox(height: 10));

              var transactions = Provider.of<JsonFiles>(context, listen: false)
                  .getTransactions()["NBA_Player_Movement"]["rows"];
              for (int i = 0; i < 200; i++) {
                var tx = transactions[i];
                list.add(Container(
                  margin: EdgeInsets.all(15),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          tx["TRANSACTION_DATE"] + "  -  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          tx["Transaction_Type"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      tx["TRANSACTION_DESCRIPTION"],
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Row(
                      children: [
                        FlatButton(
                          height: 25,
                          child: Text(
                            Provider.of<JsonFiles>(context, listen: false)
                                .getTeamName(tx["TEAM_ID"]
                                    .toString()
                                    .replaceAll(".0", "")),
                            style: TextStyle(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeamDetails(
                                        nbaTeamId: tx["TEAM_ID"]
                                            .toString()
                                            .replaceAll(".0", ""))));
                          },
                        ),
                        SizedBox(width: 10),
                        FlatButton(
                          height: 25,
                          child: Text(
                            Provider.of<JsonFiles>(context, listen: false)
                                .getPlayerName(tx["PLAYER_ID"]
                                    .toString()
                                    .replaceAll(".0", "")),
                            style: TextStyle(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ]),
                ));
              }
            } else {
              return NoConnection();
            }
            return Column(
              children: [...list],
            );
          }),
    );
  }

  Future<bool> loadData(BuildContext context) async {
    var tx = Provider.of<JsonFiles>(context, listen: false).getTransactions();

    if (tx == null) {
      try {
        var transactions = await Network.getJson(Urls.nbaPlayerMovement());
        Provider.of<JsonFiles>(context, listen: false)
            .setTransactions(transactions);
        return true;
      } catch (e) {
        print(e);
      }
    } else {
      return true;
    }

    return false;
  }
}
