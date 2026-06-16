import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._();

  static final FlutterLocalNotificationsPlugin
  _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // ✅ INIT
  static Future<void> initialize() async {
    const androidSettings =
    AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const settings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(
      settings: settings,
    );
  }

  // ✅ BASIC NOTIFICATION
  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails =
    AndroidNotificationDetails(
      'summary_channel',
      'Summary Notifications',
      channelDescription:
      'Notifications for summaries',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }

  // ✅ SUCCESS
  static Future<void> showSuccess(
      String body,
      ) async {
    await showNotification(
      title: 'Success ✅',
      body: body,
    );
  }

  // ✅ ERROR
  static Future<void> showError(
      String body,
      ) async {
    await showNotification(
      title: 'Error ❌',
      body: body,
    );
  }
}