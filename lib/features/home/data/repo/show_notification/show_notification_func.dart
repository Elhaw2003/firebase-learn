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
        icon: "note_icon_24",   // الايقونه ال بتتحط جنب اسم الابليكشن
        largeIcon: DrawableResourceAndroidBitmap("icon_note"),
        // ticker: 'ticker',
        color: AppColors.primaryColor,
        autoCancel: true,
        // enableVibration: true
        // sound: RawResourceAndroidNotificationSound("audio_notification"),
        // playSound: true,
        // colorized: true
    );
   const  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
   flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }
}