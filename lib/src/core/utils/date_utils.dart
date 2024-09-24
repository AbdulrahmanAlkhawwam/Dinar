// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// extension DateOnly on DateTime {
//   bool isSameDate(DateTime other) {
//     return this.year == other.year && this.month == other.month && this.day == other.day;
//   }
//
//   bool isOnePeriodBefore(DateTime other, String i, {DateTime? start}) {
//     if (i == "D" || i == "A") {
//       return (-this.difference(other).inHours < 24 || -this.difference(other).inDays == 1);
//     } else {
//       i = i.substring(1);
//       int wanted = i.indexOf((weekday - 1).toString()) + 1;
//       if (wanted == i.length) wanted = 0;
//       return (other.weekday - 1).toString() == i[wanted] && difference(other).inDays.abs() <= 7;
//     }
//   }
//
//   int monthDays() {
//     final d31s = [1, 3, 5, 7, 8, 10, 12];
//     final d30s = [4, 6, 9, 11];
//     if (d31s.contains(month)) {
//       return 31;
//     } else if (d30s.contains(month)) {
//       return 30;
//     } else {
//       return 28;
//     }
//   }
//
//   String toFormattedString() {
//     return "$year/$month/$day";
//   }
// }
//
// DateTime get dateNow {
//   final now = DateTime.now();
//   return DateTime.utc(now.year, now.month, now.day);
// }
//
// extension TimeOfDayToString on TimeOfDay {
//   String readable() {
//     return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
//   }
// }
//
// StartingDayOfWeek getFirstDayOfWeek(int? index) {
//   switch (index ?? 1) {
//     case 0:
//       return StartingDayOfWeek.friday;
//     case 1:
//       return StartingDayOfWeek.saturday;
//     case 2:
//       return StartingDayOfWeek.sunday;
//     case 3:
//       return StartingDayOfWeek.monday;
//   }
//   return StartingDayOfWeek.saturday;
// }
