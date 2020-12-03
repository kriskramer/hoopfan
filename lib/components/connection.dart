import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Working...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
