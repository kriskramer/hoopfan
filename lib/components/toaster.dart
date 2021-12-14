import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toaster(String message,
    {ToastGravity position = ToastGravity.BOTTOM}) async {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: position,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.lightBlue,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
