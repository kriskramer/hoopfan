class DateHelper {
  static String formatDateWithDashes(String date) {
    var dt = date.substring(0, 4) +
        "-" +
        date.substring(4, 6) +
        "-" +
        date.substring(6, 8);

    return dt;
  }

  static String formatClockWithPT(String clock) {
    String c = clock
        .replaceAll("PT", "")
        .replaceAll("M", ":")
        .replaceAll("S", "")
        .replaceAll("00:", "");
    return c;
  }
}
