import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utilies/app_colors.dart';
class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({super.key, this.onTap, required this.iconPath});
  final void Function()? onTap;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
        width: 105.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.grey.withOpacity(0.13)),
        ),
        child: SvgPicture.asset(
            iconPath
        ),
      ),
    );
  }
}
