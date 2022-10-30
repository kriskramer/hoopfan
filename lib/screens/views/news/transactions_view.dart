import 'package:flutter/material.dart';
import 'package:hoop/components/connection.dart';
import 'package:hoop/json/jsons.dart';
import 'package:hoop/screens/views/teams/team_main.dart';
import 'package:hoop/services/network.dart';
import 'package:hoop/services/urls.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  //dynamic _transactions;
  String _filteredTeamId = "";
  String _filteredPlayerId = "";
  bool _filterByTeam = false;
  bool _filterByPlayer = false;

  @override
  void initState() {
    super.initState();
    loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
          future: loadData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Widget> list = [];

            if (!snapshot.hasData) {
              return NoConnection();
            }

            if (snapshot.data == true) {
              list.add(SizedBox(height: 15));
              list.add(Text(
                  'Unfiltered results will show the last 250 transactions. Filtered results have no limit.',
                  style: TextStyle(fontSize: 14)));
              list.add(SizedBox(height: 15));

              var transactions = Provider.of<JsonFiles>(context, listen: false)
                  .getTransactions()["NBA_Player_Movement"]["rows"];

              if (_filterByTeam) {
                for (int i = 0; i < transactions.length; i++) {
                  var tx = transactions[i];
                  if (tx["TEAMID"].toString().replaceAll(".0", "") ==
                      _filteredTeamId) {
                    list.add(transactionItem(tx));
                  }
                }
              } else if (_filterByPlayer) {
                for (int i = 0; i < transactions.length; i++) {
                  var tx = transactions[i];
                  if (tx["playerId"].toString().replaceAll(".0", "") ==
                      _filteredPlayerId) {
                    list.add(transactionItem(tx));
                  }
                }
              } else {
                for (int i = 0; i < 250; i++) {
                  var tx = transactions[i];
                  list.add(transactionItem(tx));
                }
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
    var _transactions =
        Provider.of<JsonFiles>(context, listen: false).getTransactions();

    if (_transactions == null) {
      try {
        _transactions = await Network.getJson(Urls.nbaPlayerMovement());
        Provider.of<JsonFiles>(context, listen: false)
            .setTransactions(_transactions);
        return true;
      } catch (e) {
        print(e);
      }
    } else {
      return true;
    }

    return false;
  }

  void filterByTeam(String teamId) {
    setState(() {
      _filterByTeam = true;
      _filteredTeamId = teamId;
    });
  }

  void filterByPlayer(String playerId) {
    setState(() {
      _filterByPlayer = true;
      _filteredPlayerId = playerId;
    });
  }

  void clearFilters() {
    setState(() {
      _filterByPlayer = false;
      _filterByTeam = false;
      _filteredPlayerId = "";
      _filteredTeamId = "";
    });
  }

  Widget transactionItem(dynamic tx) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
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
          SizedBox(height: 10),
          Text(
            tx["TRANSACTION_DESCRIPTION"],
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 35,
            child: Row(children: [
              GestureDetector(
                child: Text(
                  Provider.of<JsonFiles>(context, listen: false).getTeamName(
                      tx["TEAMID"].toString().replaceAll(".0", "")),
                  style: TextStyle(
                      color: Colors.blue[800], fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeamDetails(
                              nbaTeamId: tx["TEAMID"]
                                  .toString()
                                  .replaceAll(".0", ""))));
                },
              ),
              _filterByTeam
                  ? IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        clearFilters();
                      },
                    )
                  : IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.filter_alt),
                      onPressed: () {
                        var teamId =
                            tx["TEAMID"].toString().replaceAll(".0", "");
                        filterByTeam(teamId);
                      },
                    ),
            ]),
          ),
          isPlayer(tx, context)
              ? Container(
                  height: 35,
                  child: Row(children: [
                    GestureDetector(
                      child: Text(
                        Provider.of<JsonFiles>(context, listen: false)
                            .getPlayerName(
                                tx["playerId"].toString().replaceAll(".0", "")),
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    ),
                    _filterByPlayer
                        ? IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              clearFilters();
                            },
                          )
                        : IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.filter_alt),
                            onPressed: () {
                              var playerId = tx["playerId"]
                                  .toString()
                                  .replaceAll(".0", "");
                              filterByPlayer(playerId);
                            },
                          ),
                  ]),
                )
              : SizedBox(
                  height: 1,
                ),
        ],
      ),
    );
  }

  bool isPlayer(dynamic tx, BuildContext context) {
    if (Provider.of<JsonFiles>(context, listen: false)
            .getPlayerName(tx["playerId"].toString().replaceAll(".0", "")) ==
        "") {
      return false;
    } else {
      return true;
    }
  }
}
