import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles{
  static  TextStyle primaryHeadLineStyle = TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 20.sp
  );
  static  TextStyle subTitlesStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp
  );
  static  TextStyle white700wSize12Inter = GoogleFonts.inter(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp
  );
  static  TextStyle black600wSize16Inter = GoogleFonts.inter(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp
  );
}