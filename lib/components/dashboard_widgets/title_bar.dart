import 'package:flutter/material.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/screens/views/account/account_main.dart';
import 'package:hoop/screens/views/players/player_search.dart';
import 'package:provider/provider.dart';

class TitleBar extends StatefulWidget {
  const TitleBar();

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    AppUser user = Provider.of<UserProv>(context, listen: false).getUser();

    return Container(
      width: double.infinity,
      //height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.symmetric(horizontal: BorderSide(color: Colors.black))),
      child: Column(children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.blue[600],
              border: Border(bottom: BorderSide(color: Colors.blue, width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(height: 22, child: Image.asset('images/bball.png')),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Hoop Fan",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerSearch()));
                      },
                      icon: Icon(Icons.search)),
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => UpdatesMain()));
                      },
                      icon: Icon(
                        Icons.notification_important_outlined,
                      )),
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountMain()))
                            .then((value) => setState(() {}));
                      },
                      icon: user.email == null
                          ? Icon(Icons.account_box_outlined)
                          : Icon(
                              Icons.account_box,
                              color: Colors.orange,
                            )),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
