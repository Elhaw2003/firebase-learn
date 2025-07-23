import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';

class GridViewNoteWidget extends StatelessWidget {
  const GridViewNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children:  [
        Card(
            color: AppColors.white,
            child: Column(
                children: [
                  Icon(Icons.folder,color: AppColors.yellow,size: 120.sp,),
                  SizedBox(height: 10.h,),
                  Text("Company",style:AppStyles.primaryHeadLineStyle,)
                ]
            )
        ),
        Card(
            color: AppColors.white,
            child: Column(
                children: [
                  Icon(Icons.folder,color: AppColors.yellow,size: 120.sp,),
                  SizedBox(height: 10.h,),
                  Text("Company",style:AppStyles.primaryHeadLineStyle,)
                ]
            )
        ),
      ],
    );
  }
}
