import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utilies/app_colors.dart';

class ArrowAppbarWidget extends StatelessWidget {
  const ArrowAppbarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41.w,
      height: 41.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.sp),
          color: Colors.transparent,
          border: Border.all(
              color: AppColors.grey.withOpacity(0.13),
              width: 1.w
          ),
      ),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            size: 19,
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.primaryColor,
          )),
    );
  }
}
