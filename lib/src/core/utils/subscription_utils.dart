// import 'package:collection/collection.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:purchases_flutter/models/package_wrapper.dart';
//
// import '../../features/subscription/domain/entities/plan.dart';
// import '../../features/subscription/domain/entities/subscription.dart';
// import '../localization/keys.g.dart';
//
// class SubscriptionUtils {
//   SubscriptionUtils._();
//
//   static Map<String, String> getInterval(PackageType packageType) {
//     switch (packageType) {
//       case PackageType.monthly:
//         return {"symbol": "1", "text": LocaleKeys.subscription_monthly_title.tr()};
//       case PackageType.annual:
//         return {"symbol": "12", "text": LocaleKeys.subscription_annual_title.tr()};
//       case PackageType.lifetime:
//         return {"symbol": "∞", "text": LocaleKeys.subscription_lifetime_title.tr()};
//       default:
//         return {"symbol": "", "text": ""};
//     }
//   }
//
//   static String getSavingPercent(PackageType packageType) {
//     switch (packageType) {
//       case PackageType.monthly:
//         return LocaleKeys.subscription_monthly_subtitle.tr();
//       case PackageType.annual:
//         return LocaleKeys.subscription_annual_subtitle.tr();
//       case PackageType.lifetime:
//         return LocaleKeys.subscription_lifetime_subtitle.tr();
//       default:
//         return "";
//     }
//   }
//
//   static String getPricePerMonth(PackageType packageType, double price) {
//     switch (packageType) {
//       case PackageType.monthly:
//         return LocaleKeys.subscription_price_per_month_args.tr(args: [price.toStringAsFixed(2)]);
//       case PackageType.annual:
//         return LocaleKeys.subscription_price_per_month_args
//             .tr(args: [(price / 12 - 0.01).toStringAsFixed(2)]);
//       case PackageType.lifetime:
//         return LocaleKeys.subscription_lifetime_sub_price.tr();
//       default:
//         return "";
//     }
//   }
//
//   static String? getPromoCorrespondingProductId(List<Plan> plans, String promoProductId) {
//     if (promoProductId.contains("month")) {
//       return plans.firstWhereOrNull((element) => element.interval == "1")?.id;
//     } else if (promoProductId.contains("year")) {
//       return plans.firstWhereOrNull((element) => element.interval == "12")?.id;
//     } else if (promoProductId.contains("lifetime")) {
//       return plans.firstWhereOrNull((element) => element.interval == "∞")?.id;
//     }
//     return null;
//   }
//
//   static SubscriptionType? getSubscriptionType(String productId) {
//     if (productId.contains("month")) {
//       return SubscriptionType.monthly;
//     } else if (productId.contains("year")) {
//       return SubscriptionType.annual;
//     } else if (productId.contains("lifetime")) {
//       return SubscriptionType.lifetime;
//     }
//     return null;
//   }
//
//   static bool isPromo(String productId) {
//     return productId.startsWith("rc_promo");
//   }
// }
