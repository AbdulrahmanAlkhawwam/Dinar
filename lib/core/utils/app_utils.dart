// import 'dart:developer' as dev;
//
// import 'package:dartz/dartz.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../errors/exceptions.dart';
// import '../errors/failures.dart';
//
// class AppUtils {
//   AppUtils._();
//
//   static Future<Either<Failure, T>> safeCall<T>(
//     Future<T> Function() call,
//   ) async {
//     try {
//       return Right(await call());
//     } on ServerException catch (e, s) {
//       dev.log(e.runtimeType.toString(), error: e, stackTrace: s);
//       if (e.statusCode != 0 && e.statusCode != 401) {
//          FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
//       }
//       return Left(ServerFailure(e.message, statusCode: e.statusCode));
//     } on AuthorizationException catch (e, s) {
//       dev.log(e.runtimeType.toString(), error: e, stackTrace: s);
//       return Left(AuthorizationFailure(e.message));
//     } on ParsingException catch (e, s) {
//       dev.log(e.runtimeType.toString(), error: e, stackTrace: s);
//       FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
//       return Left(ParsingFailure(e.message));
//     } on SubscriptionException catch (e, s) {
//       dev.log(e.runtimeType.toString(), error: e, stackTrace: s);
//       FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
//       return Left(SubscriptionFailure(e.message, code: e.code));
//     } on ChildConflictException catch (e, s) {
//       dev.log(e.runtimeType.toString(), error: e, stackTrace: s);
//       return Left(ChildConflictFailure(e.message, child: e.child));
//     } catch (e, s) {
//       dev.log(e.runtimeType.toString(), error: e, stackTrace: s);
//       FirebaseCrashlytics.instance.recordError(e, s, fatal: false);
//       return Left(UnknownFailure(e.toString()));
//     }
//   }
//
//   static bool isEmail(String email) {
//     return RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
//     ).hasMatch(email);
//   }
//
//   static getCountryFlag(String countryCode) {
//     String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
//         (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
//     return flag;
//   }
//
//   static Duration? parseDuration(String? s) {
//     if (s == null) return null;
//     try {
//       int hours = 0;
//       int minutes = 0;
//       int seconds = 0;
//       List<String> parts = s.split(':')
//         ..removeWhere((element) => element.isEmpty);
//       if (parts.length > 2) {
//         hours = int.parse(parts[parts.length - 3]);
//       }
//       if (parts.length > 1) {
//         minutes = int.parse(parts[parts.length - 2]);
//       }
//       seconds = int.parse(parts[parts.length - 1]);
//       return Duration(hours: hours, minutes: minutes, seconds: seconds);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   static shareTo(ShareDestination destination, {String? url, String? content}) {
//     if (url != null) {
//       url = Uri.encodeComponent(url);
//     }
//     final String link;
//     switch (destination) {
//       case ShareDestination.whatsapp:
//         link =
//             "https://api.whatsapp.com/send?text=$content${content != null ? "\n\n" : ""}$url";
//         break;
//       case ShareDestination.facebook:
//         link = "https://facebook.com/sharer/sharer.php?u=$url&t=$content";
//         break;
//       case ShareDestination.instagram:
//         link = "";
//         break;
//       case ShareDestination.twitter:
//         link = "https://twitter.com/intent/tweet?url=$url&text=$content";
//         break;
//       case ShareDestination.linkedin:
//         link = "https://www.linkedin.com/shareArticle?url=$url&text=$content";
//         break;
//       case ShareDestination.sms:
//         link = "sms:///?body=$content${content != null ? "\n\n" : ""}$url";
//     }
//     launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
//   }
//
//   static void openUrl(String? url) {
//     try {
//       launchUrl(Uri.parse(url!), mode: LaunchMode.externalApplication);
//     } catch (_) {}
//   }
//
//   static void openUrlWebView(String url) {
//     try {
//       launchUrl(Uri.parse(url));
//     } catch (_) {}
//   }
// }
//
// enum ShareDestination { whatsapp, facebook, instagram, twitter, linkedin, sms }
//
// extension HexColor on Color {
//   static Color? fromHex(String? hexString) {
//     if (hexString == null) return null;
//     hexString = hexString.replaceFirst("#", "");
//     if (hexString.length == 6) {
//       hexString = "FF" + hexString;
//     }
//     if (hexString.length != 8) return null;
//     int? value = int.tryParse("0x$hexString");
//     if (value == null) return null;
//     return Color(value);
//   }
// }
//
// extension DateCompare on DateTime {
//   bool isSameDate(DateTime other) {
//     return year == other.year && month == other.month && day == other.day;
//   }
//
//   bool get isToday {
//     final now = DateTime.now();
//     return isSameDate(now);
//   }
//
//   DateTime dateOnly() {
//     return DateTime.utc(year, month, day);
//   }
// }
//
// extension TimeFormat on TimeOfDay {
//   String get formatted {
//     return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
//   }
//
//   DateTime get toDateTime {
//     return DateTime.now().dateOnly()
//         .copyWith(hour: hour, minute: minute, second: 0, millisecond: 0);
//   }
//
//   int get toMinutes {
//     return minute + hour * 60;
//   }
// }
//
