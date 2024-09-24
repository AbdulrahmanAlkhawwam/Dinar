// import 'dart:math' as Math;
//
// import 'package:collection/collection.dart';
//
// import '../../features/habits/data/models/done_model.dart';
// import '../../features/habits/domain/entities/done.dart';
// import '../../features/habits/domain/entities/habit.dart';
// import 'date_utils.dart';
//
// class HabitsUtils {
//   HabitsUtils._();
//
//   static bool isHabitForDate(Habit habit, DateTime date) {
//     if (date.isBefore(habit.startDate)) return false;
//     final i = habit.interval;
//     switch (i[0]) {
//       case "A":
//       case "D":
//         if (i.length > 1) {
//           for (int j = 1; j < i.length; j++) {
//             if (int.parse(i[j]) + 1 == date.weekday) return true;
//           }
//           return false;
//         } else {
//           return true;
//         }
//       case "W":
//         return amountAchievedPerWeek(habit, date) < habit.amount ||
//             habit.completions.map((v) => v.date.millisecondsSinceEpoch).toList().reduce(Math.max) ==
//                 date.millisecondsSinceEpoch;
//       case "M":
//         return amountAchievedPerMonth(habit, date) < habit.amount ||
//             habit.completions.map((v) => v.date.millisecondsSinceEpoch).toList().reduce(Math.max) ==
//                 date.millisecondsSinceEpoch;
//     }
//     return false;
//   }
//
//   static int amountAchievedPerWeek(Habit habit, DateTime d) {
//     int weekDay = habit.startDate.weekday;
//     while (weekDay != d.weekday) {
//       d = d.subtract(Duration(days: 1));
//     }
//     int count = 0;
//     for (int i = 0; i < 7; i++) {
//       final Done day = habit.completions.firstWhere((v) => v.date == d, orElse: () {
//         return DoneModel(habitId: habit.id!, date: d, amount: 0);
//       });
//       count += day.amount;
//       d = d.add(Duration(days: 1));
//     }
//     return count;
//   }
//
//   static int amountAchievedPerMonth(Habit habit, DateTime d) {
//     int day = habit.startDate.day;
//     while (day != d.day) {
//       d = d.subtract(Duration(days: 1));
//     }
//     int count = 0;
//     for (int i = 0, monthDays = d.monthDays(); i < monthDays; i++) {
//       final day = habit.completions.firstWhere((v) => v.date == d, orElse: () {
//         return DoneModel(habitId: habit.id!, date: d, amount: 0);
//       });
//       count += day.amount;
//       d = d.add(Duration(days: 1));
//     }
//     return count;
//   }
//
//   static int getTotalDone(Habit habit) {
//     List<Done> completions = List.of(habit.completions);
//     if (habit.interval[0] == "D") {
//       completions.removeWhere((element) => element.amount < habit.amount);
//       return completions.length;
//     } else {
//       return habit.completions.fold(0, (int p, e) => e.amount + p);
//     }
//   }
//
//   static double calculateGoalProgress(Habit habit) {
//     bool isContinuous = habit.consecutive;
//     return (isContinuous ? habit.currentStreak : getTotalDone(habit)) / habit.goal;
//   }
//
//   static int completionsAmountInDate(List<Done> days, DateTime date) {
//     return days.singleWhereOrNull((element) => element.date == date)?.amount ?? 0;
//   }
//
//   static List<int> calculateStreaks(Habit habit) {
//     if (habit.completions.isEmpty) return [0, 0];
//     int streak = 0;
//     int max = 0;
//     List<Done> temp = List.of(habit.completions);
//     if (habit.interval != "A") {
//       temp.removeWhere((element) => element.amount < habit.amount);
//     }
//     if (habit.interval == "W") {
//       var d = habit.startDate;
//       while (d.difference(dateNow).inDays.abs() > 7) {
//         if (amountAchievedPerWeek(habit, d) >= habit.amount) {
//           streak++;
//           max = Math.max(max, streak);
//         } else {
//           streak = 0;
//         }
//         d = d.add(Duration(days: 7));
//       }
//       if (amountAchievedPerWeek(habit, d) >= habit.amount) {
//         streak++;
//         max = Math.max(max, streak);
//       }
//     } else if (habit.interval == "M") {
//       var d = habit.startDate;
//       while (d.difference(dateNow).inDays.abs() > 30) {
//         if (amountAchievedPerMonth(habit, d) >= habit.amount) {
//           streak++;
//           max = Math.max(max, streak);
//         } else {
//           streak = 0;
//         }
//         d = d.add(Duration(days: d.monthDays()));
//       }
//       if (amountAchievedPerMonth(habit, d) >= habit.amount) {
//         streak++;
//         max = Math.max(max, streak);
//       }
//     } else {
//       streak = 1;
//       max = 1;
//       for (int i = 0; i < temp.length - 1; i++) {
//         if (temp[i]
//             .date
//             .isOnePeriodBefore(temp[i + 1].date, habit.interval, start: habit.startDate)) {
//           streak++;
//           max = Math.max(max, streak);
//         } else {
//           streak = 1;
//         }
//       }
//     }
//     return [max, streak];
//   }
//
//   static double getCompletedAmountPercent(Habit habit, DateTime date) {
//     final int a;
//     if (habit.interval == "A" && habit.goal != 0) {
//       a = habit.completions.fold(0, (previousValue, element) => previousValue + element.amount);
//     } else if (habit.interval == "W") {
//       a = HabitsUtils.amountAchievedPerWeek(habit, date);
//     } else if (habit.interval == "M") {
//       a = HabitsUtils.amountAchievedPerMonth(habit, date);
//     } else {
//       a = habit.completions.singleWhereOrNull((element) => element.date == date)?.amount ?? 0;
//     }
//     return a / (habit.interval == "A" && habit.goal != 0 ? habit.goal : habit.amount);
//   }
// }
