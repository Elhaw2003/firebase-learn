import 'package:dartz/dartz.dart';
import 'package:firebase_learn/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../../core/utilies/app_colors.dart';

class ShowNotificationFunc {
  static void showNotification({required String title, required String body}) {
   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
        icon: "note_icon_whiteandblack",
        largeIcon: DrawableResourceAndroidBitmap("icon_note"),
        ticker: 'ticker',
        color: AppColors.primaryColor,
    );
   const  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
   flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }
}