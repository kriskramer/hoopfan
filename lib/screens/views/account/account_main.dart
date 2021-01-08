import 'package:flutter/material.dart';

class AccountMain extends StatefulWidget {
  @override
  _AccountMainState createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Text(
          'User Account',
          style: TextStyle(fontSize: 24),
        ),
        Divider(),
        Text('This feature is not fully implented.')
      ]),
    );
  }
}
