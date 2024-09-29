import 'package:easy_localization/easy_localization.dart';

import '../localization/keys.g.dart';

// First week days options
// List<String> get firstWeekDaysOptions => [
//       LocaleKeys.common_friday.tr(),
//       LocaleKeys.common_saturday.tr(),
//       LocaleKeys.common_sunday.tr(),
//       LocaleKeys.common_monday.tr(),
//     ];
//
// Theme mode options
// List<String> get themeModeOptions => [
//       LocaleKeys.settings_system_default_mode.tr(),
//       LocaleKeys.settings_light_mode.tr(),
//       LocaleKeys.settings_dark_mode.tr(),
//     ];
//
// Snooze length options
// List<String> get snoozeLengthOptions {
//   return [
//     LocaleKeys.settings_half_hour.tr(),
//     LocaleKeys.settings_hour.tr(),
//     LocaleKeys.settings_hour_and_half.tr(),
//     LocaleKeys.settings_two_hours.tr(),
//   ];
// }
//
// Periods images
// const periodsImages = ["morning", "afternoon", "evening", "night"];
//
// Available reactions used in habit notes
// const reactions = ["😃", "😍", "🥲", "😭", "❤️", "🔥"];
//
// Available intervals
// List<String> get intervals {
//   return [
//     LocaleKeys.habit_any_time.tr(),
//     LocaleKeys.habit_every_day.tr(),
//     LocaleKeys.habit_every_week.tr(),
//     LocaleKeys.habit_every_month.tr(),
//   ];
// }
//
// const intervalCodes = ["A", "D", "W", "M"];
//
// Feature discovery keys
// const appMenuFeatureKey = "app_menu";
// const habitsFilterFeatureKey = "habits_filter";
// const habitTileFeatureKey = "habit_tile";
//

/// Database
const databaseFile = "main.db";
const walletsTable = "wallets";
const categoriesTable = "categories";
const operationsTable = "operations";

// const habitsTable = "habits";
// const doneHabitsTable = "done_habits";
// const periodsTable = "periods";
// const categoriesTable = "categories";

// Notifications
// const notificationIcon = "resource://drawable/res_ic_notification";
//
// const periodGroupId = "solutions.ejad.saleem.period";
// const periodStartChannelId = "solutions.ejad.saleem.period.start";
// const periodEndChannelId = "solutions.ejad.saleem.period.end";
// const periodStartSoundPath = "resource://raw/res_start";
// const periodEndSoundPath = "resource://raw/res_end";
//
// const remindersGroupId = "solutions.ejad.saleem.reminders";
// const idleReminderChannelId = "solutions.ejad.saleem.reminders.idle";
// const morningReminderChannelId = "solutions.ejad.saleem.reminders.morning";
// const morningReminderSoundPath = "resource://raw/res_morning";
//
// const habitsTimeChannelId = "solutions.ejad.saleem.habits.time";
// const habitsTimeSoundPath = "resource://raw/res_habit";
// const habitNotificationActionSnooze = "SNOOZE";
// const habitNotificationActionDone = "DONE";
// const habitNotificationActionDismiss = "DISMISS";
//
// const firebaseMessagingChannelId = "solutions.ejad.saleem.firebase.messaging";
//
// URIs
// const ejadWebsite = "https://ejad.solutions";
// const saleemHabitsWebsite = "https://saleemhabits.com";
// const saleemHabitsMail = "mailto:saleem.habits@ejad.solutions";
//
// Shared preferences keys
const firstTimeOpenKey = "opened";
const selectedFilterKey = "selected_filter";
const wizardCompletedKey = "completed_wizard";
const firstWeekDayKey = "first_day_in_week";
const doneSoundKey = "done_sound";
const goalSoundKey = "goal_sound";
const themeModeKey = "theme_mode";
const periodsStartKey = "notifications_start";
const periodsEndKey = "notifications_end";
const habitsTimeKey = "habits_time";
const snoozeLengthKey = "snooze_length";
const subscriptionExpirationDateKey = "expiration_date";
const subscriptionProductIdKey = "product_id";
const subscriptionAllowedHabitsKey = "selected_habits_after_expiration";
const userIdKey = "user_id";
const accessTokenKey = "token";
const refreshTokenKey = "refresh_token";
const localeKey = "locale";
const deviceRegisteredKey = "device_registered";

// Firebase
// const firebaseSubscribedTopic = "subscribed_users";
// const firebaseUnsubscribedTopic = "unsubscribed_users";
//
// Privacy policy & Terms of use
// String get privacyPolicy => LocaleKeys.about_privacy_policy_content.tr();
//
// String get termsOfUse => LocaleKeys.about_terms_of_use_content.tr();
//
// const isrgRootX1 = '''-----BEGIN CERTIFICATE-----
// MIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw
// TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
// cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMTUwNjA0MTEwNDM4
// WhcNMzUwNjA0MTEwNDM4WjBPMQswCQYDVQQGEwJVUzEpMCcGA1UEChMgSW50ZXJu
// ZXQgU2VjdXJpdHkgUmVzZWFyY2ggR3JvdXAxFTATBgNVBAMTDElTUkcgUm9vdCBY
// MTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK3oJHP0FDfzm54rVygc
// h77ct984kIxuPOZXoHj3dcKi/vVqbvYATyjb3miGbESTtrFj/RQSa78f0uoxmyF+
// 0TM8ukj13Xnfs7j/EvEhmkvBioZxaUpmZmyPfjxwv60pIgbz5MDmgK7iS4+3mX6U
// A5/TR5d8mUgjU+g4rk8Kb4Mu0UlXjIB0ttov0DiNewNwIRt18jA8+o+u3dpjq+sW
// T8KOEUt+zwvo/7V3LvSye0rgTBIlDHCNAymg4VMk7BPZ7hm/ELNKjD+Jo2FR3qyH
// B5T0Y3HsLuJvW5iB4YlcNHlsdu87kGJ55tukmi8mxdAQ4Q7e2RCOFvu396j3x+UC
// B5iPNgiV5+I3lg02dZ77DnKxHZu8A/lJBdiB3QW0KtZB6awBdpUKD9jf1b0SHzUv
// KBds0pjBqAlkd25HN7rOrFleaJ1/ctaJxQZBKT5ZPt0m9STJEadao0xAH0ahmbWn
// OlFuhjuefXKnEgV4We0+UXgVCwOPjdAvBbI+e0ocS3MFEvzG6uBQE3xDk3SzynTn
// jh8BCNAw1FtxNrQHusEwMFxIt4I7mKZ9YIqioymCzLq9gwQbooMDQaHWBfEbwrbw
// qHyGO0aoSCqI3Haadr8faqU9GY/rOPNk3sgrDQoo//fb4hVC1CLQJ13hef4Y53CI
// rU7m2Ys6xt0nUW7/vGT1M0NPAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNV
// HRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5tFnme7bl5AFzgAiIyBpY9umbbjANBgkq
// hkiG9w0BAQsFAAOCAgEAVR9YqbyyqFDQDLHYGmkgJykIrGF1XIpu+ILlaS/V9lZL
// ubhzEFnTIZd+50xx+7LSYK05qAvqFyFWhfFQDlnrzuBZ6brJFe+GnY+EgPbk6ZGQ
// 3BebYhtF8GaV0nxvwuo77x/Py9auJ/GpsMiu/X1+mvoiBOv/2X/qkSsisRcOj/KK
// NFtY2PwByVS5uCbMiogziUwthDyC3+6WVwW6LLv3xLfHTjuCvjHIInNzktHCgKQ5
// ORAzI4JMPJ+GslWYHb4phowim57iaztXOoJwTdwJx4nLCgdNbOhdjsnvzqvHu7Ur
// TkXWStAmzOVyyghqpZXjFaH3pO3JLF+l+/+sKAIuvtd7u+Nxe5AW0wdeRlN8NwdC
// jNPElpzVmbUq4JUagEiuTDkHzsxHpFKVK7q4+63SM1N95R1NbdWhscdCb+ZAJzVc
// oyi3B43njTOQ5yOf+1CceWxG1bQVs5ZufpsMljq4Ui0/1lvh+wjChP4kqKOJ2qxq
// 4RgqsahDYVvTH9w7jXbyLeiNdd8XM2w9U/t7y0Ff/9yi0GE44Za4rF2LN9d11TPA
// mRGunUHBcnWEvgJBQl9nJEiU0Zsnvgc/ubhPgXRR4Xq37Z0j4r7g1SgEEzwxA57d
// emyPxgcYxn/eR44/KJ4EBs+lVDR3veyJm+kXQ99b21/+jh5Xos1AnX5iItreGCc=
// -----END CERTIFICATE-----
// ''';
