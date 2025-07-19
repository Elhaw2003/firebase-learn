import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilies/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child:  Divider(
        color: AppColors.grey.withOpacity(0.21),
      ),
    );
  }
}
