import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      this.onPressed,
      required this.title,
      required this.titleColor,
      required this.buttonColor,
      required this.borderColor, this.iconPath});
  final void Function()? onPressed;
  final String title;
  final Color titleColor;
  final Color buttonColor;
  final Color borderColor;
  final String? iconPath;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(331.w, 56.h)),
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(width: 10.w,),
            iconPath != null ? SvgPicture.asset(iconPath!,) : const SizedBox.shrink(),
          ],
        ),
    );
  }
}
