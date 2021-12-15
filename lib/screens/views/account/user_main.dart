import 'package:flutter/material.dart';

class UserMain extends StatefulWidget {
  const UserMain();

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Account"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Text("This feature is coming soon..."),
        ),
      ),
    );
  }
}
