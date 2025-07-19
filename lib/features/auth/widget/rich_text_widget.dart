import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utilies/app_colors.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, required this.firstText, required this.secondText, this.onTap});
  final String firstText;
  final String secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          text: "$firstText  ",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp
          ),
          children: [
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap =onTap,
                text: secondText,
                style: TextStyle(
                    color: AppColors.black202955,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp
                )
            )
          ]
        ),
    );
  }
}
