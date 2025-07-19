import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_texts.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key,  this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppTexts.forgotPassword,
          style: TextStyle(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
