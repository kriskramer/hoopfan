import 'package:flutter/material.dart';
import 'package:hoop/stat_definition.dart';

class StatInfoDialog extends StatelessWidget {
  final Text label;
  final String statName;

  const StatInfoDialog({this.label, this.statName});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return getStatInfoDialog(statName, context);
                  });
            },
            child: label));
  }

  Widget getStatInfoDialog(String statLabel, BuildContext context) {
    Stat s = StatHelper.getStat(statLabel.toUpperCase());

    if (s == null || s.name == null) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          content: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("No Data Found"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ]);
    } else {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          content: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(s.name,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Divider(),
                Text(s.description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text(s.formula, style: TextStyle(fontSize: 14)),
                SizedBox(height: 20),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ]);
    }
  }
}
