class DateUtils {
  static int currentWeek() {
    return weekOfYear(DateTime.now());
  }

  static int weekOfYear(DateTime date) {
    DateTime monday = weekStart(date);
    DateTime first = weekYearStartDate(monday.year);
    int week = 1 + (monday.difference(first).inDays / 7).floor();
    if (week == 53 && DateTime(monday.year, 12, 31).weekday < 4) week = 1;
    return week;
  }

  static DateTime weekStart(DateTime date) {
    DateTime monday = DateTime.utc(date.year, date.month, date.day);
    monday = monday.subtract(Duration(days: monday.weekday - 1));
    return monday;
  }

  static DateTime weekEnd(DateTime date) {
    DateTime sunday =
        DateTime.utc(date.year, date.month, date.day, 23, 59, 59, 999, 999999);
    sunday = sunday.add(Duration(days: 7 - sunday.weekday));
    return sunday;
  }

  static DateTime yearStart(DateTime date) {
    DateTime monday = DateTime.utc(date.year, date.month, date.day);
    monday = monday.subtract(Duration(days: monday.weekday - 1));
    return monday;
  }

  static DateTime weekYearStartDate(int year) {
    final firstDayOfYear = DateTime.utc(year, 1, 1);
    final dayOfWeek = firstDayOfYear.weekday;
    return firstDayOfYear.add(
        Duration(days: (dayOfWeek <= DateTime.thursday ? 1 : 8) - dayOfWeek));
  }
}
