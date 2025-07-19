
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utilies/app_colors.dart';
import '../../../core/widgets/custom_divider_widget.dart';

class OrLoginRegisterWidget extends StatelessWidget {
  const OrLoginRegisterWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomDividerWidget(width: 100),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGrey
          ),
        ),
        const CustomDividerWidget(width: 100),
      ],
    );
  }
}
