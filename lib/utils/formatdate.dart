import 'package:hoop/utils/month_dict.dart';

List<String> formatDate(String date) {
  String localDate = "";
  String localTime = "";

  var dt =
      DateTime.parse(date).toLocal(); // convert the Date to your local date
  String month = monthStr[dt.month];
  localDate = "$month-${dt.day}-${dt.year}";
  String minute = dt.minute < 10 ? "0${dt.minute}" : "${dt.minute}";
  if (dt.hour >= 0 && dt.hour < 12) {
    String hour = dt.hour == 0 ? "12" : "${dt.hour}";

    localTime = "$hour:$minute am";
  } else {
    Map<int, String> hourEquivalent = {
      13: "1",
      14: "2",
      15: "3",
      16: "4",
      17: "5",
      18: "6",
      19: "7",
      20: "8",
      21: "9",
      22: "10",
      23: "11"
    };

    String hour = dt.hour != 12 ? hourEquivalent[dt.hour] : dt.hour;
    localTime = "$hour:$minute pm";
  }

  return [localDate, localTime]; // returns a list of date and then time
}
