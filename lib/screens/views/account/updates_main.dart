import 'package:flutter/material.dart';

class UpdatesMain extends StatelessWidget {
  const UpdatesMain();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Welcome to Hoop Fan!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "This app is currently in alpha, which means initial development and testing is on-going. In layman's terms, some features are working while others will work soon. So please bear with us!"),
            SizedBox(
              height: 10,
            ),
            Text("To see the latest, visit our Facebook page:"),
            Text(
              "https://www.facebook.com/HoopFan1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Text(
              "Development Updates",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Watch here for patch notes")
          ],
        ),
      ),
    );
  }
}
