import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/widgets/custom_lottie_widget.dart';
import 'package:firebase_learn/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).pushNamed(
          FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified   ? AppRoutes.homeScreen : AppRoutes.loginScreen,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLottieWidget(name: Assets.lottiesIconSplash),
      )
    );
  }
}
