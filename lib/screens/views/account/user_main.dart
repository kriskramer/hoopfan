import 'package:flutter/material.dart';
import 'package:hoop/api/config/firebase.dart';
import 'package:hoop/components/user_widgets/usr_button.dart';
import 'package:hoop/model/user.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/screens/views/account/login_ui.dart';
import 'package:hoop/screens/views/account/signup_ui.dart';
import 'package:provider/provider.dart';

class UserMain extends StatefulWidget {
  const UserMain();

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  @override
  Widget build(BuildContext context) {
    AppUser user = Provider.of<UserProv>(context, listen: false).getUser();
    String initials = getDisplayNameInitials(user.displayName);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                minRadius: 30,
                maxRadius: 80,
                backgroundColor: Colors.grey.shade800,
                child: Text(
                  initials,
                  style: TextStyle(fontSize: 40),
                ),
              )),
          user.email == null
              ? Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    "You are not logged in. ",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    "Currently logged in as: ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
          user.displayName == null
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    user.displayName,
                    style: TextStyle(fontSize: 26),
                  ),
                ),
          user.email == null
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    user.email,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          user.email == null
              ? Container(
                  child: Column(
                    children: [
                      UserButton(
                        title: "LOGIN",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginUI(),
                            ),
                          ).then((value) => {setState(() {})});
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      UserButton(
                        title: "SIGNUP",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupUI(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Column(children: [
                  UserButton(
                    title: "LOGOUT",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUI(),
                        ),
                      ).then((value) => {setState(() {})});
                    },
                  ),
                ]))
        ],
      ),
    );
  }
}

String getDisplayNameInitials(String name) {
  if (name == null) {
    return "??";
  } else {
    String i = "";
    i = name[0];
    var spaceIndex = name.indexOf(" ");
    i += name.substring(spaceIndex + 1, spaceIndex + 2);
    return i;
  }
}
