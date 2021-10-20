import 'package:hoop/utils/month_dict.dart';

String formatDate(String date) {
  String d = "";

  var dt = DateTime.parse(date);
  String month = monthStr[dt.month];
  d = "$month-${dt.day}-${dt.year}";

  return d;
}
