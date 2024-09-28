// import 'package:mixpanel_flutter/mixpanel_flutter.dart';
//
// abstract class AnalyticsHelper {
//   void event(String event, {Map<String, dynamic>? properties});
//
//   void setGlobalProperties(Map<String, dynamic> properties);
//
//   void unsetGlobalProperties(List<String> properties);
//
//   void setUserId(String? userId);
// }
//
// class AnalyticsHelperImpl implements AnalyticsHelper {
//   final Mixpanel mixpanel;
//
//   AnalyticsHelperImpl({required this.mixpanel});
//
//   @override
//   void event(String event, {Map<String, dynamic>? properties}) {
//     mixpanel.track(event, properties: properties);
//   }
//
//   @override
//   void setGlobalProperties(Map<String, dynamic> properties) {
//     mixpanel.registerSuperProperties(properties);
//   }
//
//   @override
//   void unsetGlobalProperties(List<String> properties) {
//     for (final property in properties) {
//       mixpanel.unregisterSuperProperty(property);
//     }
//   }
//
//   @override
//   void setUserId(String? userId) {
//     if (userId != null) {
//       mixpanel.identify(userId);
//     } else {
//       mixpanel.reset();
//     }
//   }
// }
