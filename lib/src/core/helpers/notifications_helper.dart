// import 'dart:async';
// import 'dart:io';
//
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:collection/collection.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:mixpanel_flutter/mixpanel_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../../features/habits/data/models/habit_model.dart';
// import '../../features/habits/domain/entities/habit.dart';
// import '../../features/home/presentation/pages/home_page.dart';
// import '../../features/periods/data/models/period_model.dart';
// import '../../features/periods/domain/entities/period.dart';
// import '../constants/env.dart';
// import '../constants/strings.dart';
// import '../constants/colors.dart';
// import '../constants/tracking_events.dart';
// import '../localization/keys.g.dart';
// import '../service_locator/service_locator.dart';
// import '../utils/date_utils.dart';
// import 'database_helper.dart';
//
// abstract class NotificationsHelper {
//   static const idleNotificationId = 2000;
//   static const morningNotificationId = 3000;
//
//   static const periodEndIdOffset = 1000;
//   static const habitIdOffset = 10000;
//   static const habitWeekDaysIdOffset = 20000;
//   static const habitSnoozeIdOffset = 1;
//
//   Future<String?> getDeviceToken();
//
//   Future<void> deleteDeviceToken();
//
//   void schedulePeriodStartNotification(Period period);
//
//   void schedulePeriodsStartNotification(List<Period> periods);
//
//   void schedulePeriodEndNotification(Period period);
//
//   void schedulePeriodsEndNotification(List<Period> periods);
//
//   void scheduleIdleNotification();
//
//   void scheduleMorningNotification(TimeOfDay? startTime);
//
//   void scheduleHabitNotification(Habit habit);
//
//   void scheduleHabitsNotifications(List<Habit> habits);
//
//   void rescheduleNotifications();
//
//   Future<List<int>> getScheduledNotificationsIds();
//
//   void cancelNotification(int id);
//
//   void cancelPeriodNotifications(int periodId);
//
//   void cancelPeriodsStartNotification();
//
//   void cancelPeriodsEndNotification();
//
//   void cancelHabitsTimeNotifications();
// }
//
// class NotificationsHelperImpl implements NotificationsHelper {
//   static bool isInitialized = false;
//
//   NotificationsHelperImpl._();
//
//   static Future<NotificationsHelperImpl> instance() async {
//     await AwesomeNotifications().initialize(
//       notificationIcon,
//       [
//         NotificationChannel(
//           groupKey: periodGroupId,
//           channelKey: periodStartChannelId,
//           channelName: "Periods start reminders",
//           channelDescription: "Start time of each period",
//           defaultColor: darkColorScheme.primary,
//           importance: NotificationImportance.Max,
//           soundSource: periodStartSoundPath,
//         ),
//         NotificationChannel(
//           groupKey: periodGroupId,
//           channelKey: periodEndChannelId,
//           channelName: "Periods end reminders",
//           channelDescription: "End time of each period",
//           defaultColor: darkColorScheme.primary,
//           importance: NotificationImportance.Max,
//           soundSource: periodEndSoundPath,
//         ),
//         NotificationChannel(
//           groupKey: remindersGroupId,
//           channelKey: idleReminderChannelId,
//           channelName: "Idle reminders",
//           channelDescription: "Send reminders for idle user",
//           defaultColor: darkColorScheme.primary,
//           importance: NotificationImportance.High,
//         ),
//         NotificationChannel(
//           groupKey: remindersGroupId,
//           channelKey: morningReminderChannelId,
//           channelName: "Morning reminders",
//           channelDescription: "Send notification to open the app",
//           defaultColor: darkColorScheme.primary,
//           importance: NotificationImportance.High,
//           soundSource: morningReminderSoundPath,
//         ),
//         NotificationChannel(
//           channelKey: habitsTimeChannelId,
//           channelName: "Habits time",
//           channelDescription: "User's created habits reminder",
//           defaultColor: darkColorScheme.primary,
//           importance: NotificationImportance.High,
//           soundSource: habitsTimeSoundPath,
//         ),
//         NotificationChannel(
//           channelKey: firebaseMessagingChannelId,
//           channelName: "Remote notifications",
//           channelDescription: "Remote notifications from the server",
//           defaultColor: darkColorScheme.primary,
//           importance: NotificationImportance.Max,
//         ),
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//           channelGroupKey: periodGroupId,
//           channelGroupName: "Periods",
//         ),
//         NotificationChannelGroup(
//           channelGroupKey: remindersGroupId,
//           channelGroupName: "Reminders",
//         ),
//       ],
//       debug: kDebugMode,
//     );
//
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: NotificationController.onActionReceivedMethod,
//       onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
//       onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
//     );
//
//     isInitialized = true;
//
//     return NotificationsHelperImpl._();
//   }
//
//   static NotificationsHelperImpl get initializedInstance {
//     assert(isInitialized);
//     return NotificationsHelperImpl._();
//   }
//
//   @override
//   Future<String?> getDeviceToken() async {
//     try {
//       return await FirebaseMessaging.instance.getToken();
//     } catch (e) {
//       return null;
//     }
//   }
//
//   @override
//   Future<void> deleteDeviceToken() async {
//     FirebaseMessaging.instance.deleteToken().catchError((e) {});
//   }
//
//   @override
//   void scheduleHabitNotification(Habit habit) async {
//     scheduleNotificationInWeekday(int? weekday) {
//       AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: habit.id! * NotificationsHelper.habitIdOffset +
//               (weekday ?? 0) * NotificationsHelper.habitWeekDaysIdOffset,
//           channelKey: habitsTimeChannelId,
//           title: habit.name,
//           body: habit.notification!.message,
//           category: NotificationCategory.Reminder,
//           payload: {
//             habitNotificationActionSnooze:
//                 LocaleKeys.settings_notification_action_remind_me_later.tr(),
//             habitNotificationActionDone: LocaleKeys.settings_notification_action_done.tr(),
//             habitNotificationActionDismiss: LocaleKeys.settings_notification_action_dismiss.tr(),
//           },
//         ),
//         schedule: NotificationCalendar(
//           hour: habit.notification!.time.hour,
//           minute: habit.notification!.time.minute,
//           second: 0,
//           weekday: weekday,
//           repeats: true,
//           allowWhileIdle: true,
//           timeZone: AwesomeNotifications.localTimeZoneIdentifier,
//         ),
//         actionButtons: [
//           NotificationActionButton(
//             key: habitNotificationActionSnooze,
//             label: LocaleKeys.settings_notification_action_remind_me_later.tr(),
//             actionType: Platform.isIOS ? ActionType.Default : ActionType.SilentBackgroundAction,
//           ),
//           NotificationActionButton(
//             key: habitNotificationActionDone,
//             label: LocaleKeys.settings_notification_action_done.tr(),
//             actionType: Platform.isIOS ? ActionType.Default : ActionType.SilentBackgroundAction,
//           ),
//           NotificationActionButton(
//             key: habitNotificationActionDismiss,
//             label: LocaleKeys.settings_notification_action_dismiss.tr(),
//             actionType: ActionType.DisabledAction,
//           ),
//         ],
//       );
//     }
//
//     if (habit.interval[0] == "D" && habit.interval.length > 1) {
//       for (int i = 1; i < habit.interval.length; i++) {
//         int day = int.parse(habit.interval[i]) + 1;
//         scheduleNotificationInWeekday(day);
//       }
//     } else {
//       scheduleNotificationInWeekday(null);
//     }
//   }
//
//   @override
//   void scheduleHabitsNotifications(List<Habit> habits) {
//     for (final habit in habits) {
//       scheduleHabitNotification(habit);
//     }
//   }
//
//   @override
//   void scheduleIdleNotification() {
//     var dateTime = DateTime.now();
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: NotificationsHelper.idleNotificationId,
//         channelKey: idleReminderChannelId,
//         title: LocaleKeys.settings_idle_notification_title.tr(),
//         body: LocaleKeys.settings_idle_notification_body.tr(),
//         category: NotificationCategory.Reminder,
//       ),
//       schedule: NotificationCalendar(
//         day: dateTime.add(Duration(days: 2)).day,
//         hour: dateTime.hour,
//         minute: dateTime.minute,
//         allowWhileIdle: true,
//         repeats: false,
//         timeZone: AwesomeNotifications.localTimeZoneIdentifier,
//       ),
//     );
//   }
//
//   @override
//   void scheduleMorningNotification(TimeOfDay? startTime) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: NotificationsHelper.morningNotificationId,
//         channelKey: morningReminderChannelId,
//         title: LocaleKeys.settings_morning_notification_title.tr(),
//         body: LocaleKeys.settings_morning_notification_body.tr(),
//         category: NotificationCategory.Reminder,
//       ),
//       schedule: NotificationCalendar(
//         hour: startTime?.hour ?? 7,
//         minute: startTime?.minute ?? 0,
//         second: 0,
//         repeats: true,
//         allowWhileIdle: true,
//         timeZone: AwesomeNotifications.localTimeZoneIdentifier,
//       ),
//     );
//   }
//
//   @override
//   void schedulePeriodStartNotification(Period period) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: period.id!,
//         channelKey: periodStartChannelId,
//         title: period.name,
//         body: LocaleKeys.settings_period_start_notification_title.tr(),
//         category: NotificationCategory.Reminder,
//       ),
//       schedule: NotificationCalendar(
//         hour: period.start!.hour,
//         minute: period.start!.minute,
//         second: 0,
//         repeats: true,
//         allowWhileIdle: true,
//         timeZone: AwesomeNotifications.localTimeZoneIdentifier,
//       ),
//     );
//   }
//
//   @override
//   void schedulePeriodsStartNotification(List<Period> periods) {
//     periods.forEach((period) {
//       if (period.id == null || period.start == null) return;
//       schedulePeriodStartNotification(period);
//     });
//   }
//
//   @override
//   void schedulePeriodEndNotification(Period period) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: period.id! + NotificationsHelper.periodEndIdOffset,
//         channelKey: periodEndChannelId,
//         title: period.name,
//         body: LocaleKeys.settings_period_end_notification_title.tr(),
//         category: NotificationCategory.Reminder,
//       ),
//       schedule: NotificationCalendar(
//         hour: period.end!.hour,
//         minute: period.end!.minute,
//         second: 0,
//         repeats: true,
//         allowWhileIdle: true,
//         timeZone: AwesomeNotifications.localTimeZoneIdentifier,
//       ),
//     );
//   }
//
//   @override
//   void schedulePeriodsEndNotification(List<Period> periods) {
//     periods.forEach((period) {
//       if (period.id == null || period.start == null) return;
//       schedulePeriodEndNotification(period);
//     });
//   }
//
//   @override
//   void rescheduleNotifications() {
//     AwesomeNotifications().listScheduledNotifications().then((notifications) {
//       for (final notification in notifications) {
//         if (notification.content == null || notification.schedule == null) continue;
//         String title = notification.content!.title!;
//         String body = notification.content!.body!;
//         List<NotificationActionButton>? actionButtons;
//         if (notification.content!.id! < 1000) {
//           body = LocaleKeys.settings_period_start_notification_title.tr();
//         } else if (notification.content!.id! < 2000) {
//           body = LocaleKeys.settings_period_end_notification_title.tr();
//         } else if (notification.content!.id! == NotificationsHelper.idleNotificationId) {
//           title = LocaleKeys.settings_idle_notification_title.tr();
//           body = LocaleKeys.settings_idle_notification_body.tr();
//         } else if (notification.content!.id! == NotificationsHelper.morningNotificationId) {
//           title = LocaleKeys.settings_morning_notification_title.tr();
//           body = LocaleKeys.settings_morning_notification_body.tr();
//         } else {
//           actionButtons = [
//             NotificationActionButton(
//               key: habitNotificationActionSnooze,
//               label: LocaleKeys.settings_notification_action_remind_me_later.tr(),
//               actionType: Platform.isIOS ? ActionType.Default : ActionType.SilentBackgroundAction,
//             ),
//             NotificationActionButton(
//               key: habitNotificationActionDone,
//               label: LocaleKeys.settings_notification_action_done.tr(),
//               actionType: Platform.isIOS ? ActionType.Default : ActionType.SilentBackgroundAction,
//             ),
//             NotificationActionButton(
//               key: habitNotificationActionDismiss,
//               label: LocaleKeys.settings_notification_action_dismiss.tr(),
//               actionType: ActionType.DisabledAction,
//             ),
//           ];
//         }
//         AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: notification.content!.id!,
//             channelKey: notification.content!.channelKey!,
//             title: title,
//             body: body,
//             category: NotificationCategory.Reminder,
//           ),
//           schedule: notification.schedule,
//           actionButtons: actionButtons,
//         );
//       }
//     });
//   }
//
//   @override
//   Future<List<int>> getScheduledNotificationsIds() async {
//     final notifications = await AwesomeNotifications().listScheduledNotifications();
//     return notifications.map((notification) => notification.content!.id!).toList();
//   }
//
//   @override
//   void cancelNotification(int id) {
//     AwesomeNotifications().cancel(id);
//   }
//
//   @override
//   void cancelPeriodNotifications(int periodId) {
//     cancelNotification(periodId);
//     cancelNotification(periodId + NotificationsHelper.periodEndIdOffset);
//   }
//
//   @override
//   void cancelPeriodsStartNotification() {
//     AwesomeNotifications().cancelNotificationsByChannelKey(periodStartChannelId);
//   }
//
//   @override
//   void cancelPeriodsEndNotification() {
//     AwesomeNotifications().cancelNotificationsByChannelKey(periodEndChannelId);
//   }
//
//   @override
//   void cancelHabitsTimeNotifications() {
//     AwesomeNotifications().cancelNotificationsByChannelKey(habitsTimeChannelId);
//   }
// }
//
// class NotificationController {
//   @pragma('vm:entry-point')
//   static Future<void> onActionReceivedMethod(ReceivedAction action) async {
//     Mixpanel mp = await Mixpanel.init(Env.mixpanelToken, trackAutomaticEvents: true);
//     if (action.buttonKeyPressed == habitNotificationActionSnooze) {
//       final id = action.id;
//       final title = action.title;
//       final body = action.body;
//       final payload = action.payload;
//       if (id == null || title == null || body == null) return;
//       mp.track(Events.snoozeNotification);
//       await _scheduleSnoozedNotification(id, title, body, payload);
//       if (Platform.isIOS) {
//         HomePage.openedHabitId = id ~/ 10000;
//       }
//     } else if (action.buttonKeyPressed == habitNotificationActionDone) {
//       final id = action.id;
//       if (id == null) return;
//       mp.track(Events.checkHabit, properties: {"From": "Notification"});
//       await _markHabitAsDone(id ~/ 10000);
//       if (Platform.isIOS) {
//         HomePage.openedHabitId = id ~/ 10000;
//       }
//     } else if (action.buttonKeyPressed == habitNotificationActionDismiss) {
//       mp.track(Events.dismissNotification);
//     }
//   }
//
//   static Future<void> _scheduleSnoozedNotification(
//       int id, String title, String body, Map<String, String?>? payload) async {
//     final preferences = await SharedPreferences.getInstance();
//     final s = preferences.getInt("snooze_length") ?? 1;
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: id + NotificationsHelper.habitSnoozeIdOffset,
//         channelKey: habitsTimeChannelId,
//         title: title,
//         body: body,
//         category: NotificationCategory.Reminder,
//         payload: payload,
//       ),
//       schedule: NotificationInterval(
//         interval: s * 30 * 60,
//         repeats: false,
//         allowWhileIdle: true,
//         timeZone: AwesomeNotifications.localTimeZoneIdentifier,
//       ),
//       actionButtons: [
//         NotificationActionButton(
//           key: habitNotificationActionSnooze,
//           label: payload?[habitNotificationActionSnooze] ?? "Snooze",
//           actionType: Platform.isIOS ? ActionType.Default : ActionType.SilentBackgroundAction,
//         ),
//         NotificationActionButton(
//           key: habitNotificationActionDone,
//           label: payload?[habitNotificationActionDone] ?? "Done",
//           actionType: Platform.isIOS ? ActionType.Default : ActionType.SilentBackgroundAction,
//         ),
//         NotificationActionButton(
//           key: habitNotificationActionDismiss,
//           label: payload?[habitNotificationActionDismiss] ?? "Dismiss",
//           actionType: ActionType.DisabledAction,
//         ),
//       ],
//     );
//   }
//
//   static Future<void> _markHabitAsDone(int id) async {
//     final db = await DatabaseHelperImpl.instance();
//     final list = await db.getData(habitsTable, where: "id = ?", args: [id]);
//     final habit = HabitModel.fromMap(list.single);
//
//     final habitAlreadyDone = await db.getData(
//       doneHabitsTable,
//       where: "habit_id = ? AND date = ?",
//       args: [id, dateNow.millisecondsSinceEpoch],
//     );
//
//     await db.insert(doneHabitsTable, {
//       "id": habitAlreadyDone.firstOrNull?["id"],
//       "habit_id": id,
//       "date": dateNow.millisecondsSinceEpoch,
//       "amount": habit.interval[0] == "D" ? habit.amount : 1,
//     });
//   }
//
//   @pragma('vm:entry-point')
//   static Future<void> onNotificationDisplayedMethod(notification) async {
//     Mixpanel mp = await Mixpanel.init(Env.mixpanelToken, trackAutomaticEvents: true);
//     mp.track(Events.displayNotification);
//   }
//
//   @pragma('vm:entry-point')
//   static Future<void> onDismissActionReceivedMethod(notification) async {
//     Mixpanel mp = await Mixpanel.init(Env.mixpanelToken, trackAutomaticEvents: true);
//     mp.track(Events.dismissNotification);
//   }
// }
//
// Future migrateNotifications(Database db) async {
//   // Cancel old notifications
//   final oldNotifications = FlutterLocalNotificationsPlugin();
//   const android = AndroidInitializationSettings('res_ic_notification');
//   final iOS = DarwinInitializationSettings();
//   final initializationSettings = InitializationSettings(android: android, iOS: iOS);
//   await oldNotifications.initialize(initializationSettings);
//   oldNotifications.cancelAll();
//   final androidSettings = oldNotifications
//       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//   await androidSettings?.deleteNotificationChannel("solutions.ejad.saleem.start_period");
//   await androidSettings?.deleteNotificationChannel("solutions.ejad.saleem.end_period");
//
//   // Enable periods notifications
//   final list = await db.query(periodsTable);
//   final periods = List.generate(list.length, (i) => PeriodModel.fromMap(list[i]));
//   final periodsStart = sl<SharedPreferences>().getBool(periodsStartKey) ?? true;
//   final periodsEnd = sl<SharedPreferences>().getBool(periodsEndKey) ?? true;
//   for (final period in periods) {
//     if (period.start == null || period.end == null) continue;
//     if (periodsStart) sl<NotificationsHelper>().schedulePeriodStartNotification(period);
//     if (periodsEnd) sl<NotificationsHelper>().schedulePeriodEndNotification(period);
//   }
//
//   // Enable morning reminder
//   TimeOfDay? firstPeriodStart = TimeOfDay(hour: 6, minute: 0);
//   periods.forEach((element) {
//     if (element.start == null) return;
//     if (element.start!.hour < firstPeriodStart!.hour) firstPeriodStart = element.start!;
//   });
//   if (firstPeriodStart!.hour > 9 || firstPeriodStart!.hour < 3) firstPeriodStart = null;
//   sl<NotificationsHelper>().scheduleMorningNotification(firstPeriodStart);
// }
