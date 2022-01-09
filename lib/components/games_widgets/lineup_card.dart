import 'package:flutter/material.dart';

class LineupCard extends StatelessWidget {
  const LineupCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(children: [
          Text(
            'LINEUPS',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
