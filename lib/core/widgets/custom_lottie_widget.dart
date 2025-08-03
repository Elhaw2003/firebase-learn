import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLottieWidget extends StatelessWidget {
  const CustomLottieWidget({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
          name,
         fit: BoxFit.fill,
         width: 250.w,
        height: 250.h
      ),
    );
  }
}
