import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learn/core/app_routes/router_generation.dart';
import 'package:firebase_learn/features/auth/login/presentation/view/login_screen.dart';
import 'package:firebase_learn/features/home/presentation/view/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/manage_cubit_servise.dart';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("============================================");
//   print(message.notification!.title);
//   print(message.notification!.body);
//   print("============================================");
// }
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // اعداد خاص بال android only
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('note_icon_whiteandblack');
  // اعداد خاص بال all
  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid,);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  Bloc.observer = MyBlocObserver();
  runApp(const FirebaseLearnApp());
}

class FirebaseLearnApp extends StatefulWidget {
  const FirebaseLearnApp({super.key});

  @override
  State<FirebaseLearnApp> createState() => _FirebaseLearnAppState();
}

class _FirebaseLearnAppState extends State<FirebaseLearnApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('==============================User is currently signed out!');
      } else {
        print('==============================User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouterGenerator.routerGeneration,
        );
      },
    );
  }
}

